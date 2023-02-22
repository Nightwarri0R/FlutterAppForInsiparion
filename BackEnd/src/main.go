package main

import (
	"fmt"
	"net/http"
	"log"
	"github.com/gorilla/mux"
)
func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("HomePage")
}
func handleRoutes(){
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	log.Fatal(http.ListenAndServe(":8090", router))
}

func main() {
	handleRoutes()
	allQuotes()
	fmt.Println(quotes)
}

type Quotes struct {
	ID     string `json:"id"`
	Quote  string `json:"quote"`
	Author string `json:"author"`
	Date   string `json:"date"`
}

var quotes []Quotes

func allQuotes() {
	quote := Quotes{
		ID:     "1",
		Quote:  "I am a quote",
		Author: "John Doe",
		Date:   "1979-05-27"}
	quotes = append(quotes, quote)
}
