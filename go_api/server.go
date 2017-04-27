package main

import (
        "fmt"
        "net/http"
        "github.com/gorilla/mux"
        "gopkg.in/mgo.v2"
        "gopkg.in/mgo.v2/bson"
     )

type Document struct {
  Name string
  Content string
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/", getDocument).Methods("POST")
	http.ListenAndServe(":8060", router)
}

func getDocument(res http.ResponseWriter, req *http.Request){

  name := req.FormValue("name")

  session, err := mgo.Dial("mongodb:27017")
  if err != nil {
          panic(err)
  }
  defer session.Close()

  session.SetMode(mgo.Monotonic, true)

  c := session.DB("go_api").C("config")

  result := Document{}

  err = c.Find(bson.M{"name": name}).One(&result)

  if err != nil {
          panic(err)
  }

  fmt.Fprint(res, result.Addr)

}
