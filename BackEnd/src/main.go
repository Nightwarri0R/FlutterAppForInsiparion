package main

import (
	"fmt"
	"net/http"
	"log"
	"encoding/json"
	"github.com/gorilla/mux"
)
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

	quote1 := Quotes{
		ID:     "322",
		Quote:  "I am a quote",
		Author: "John Doe",
		Date:   "1979-05-27"}
	quotes = append(quotes, quote1)
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("HomePage")
}

func getQuote(w http.ResponseWriter, r *http.Request) {
	quoteId := mux.Vars(r)
	id := quoteId["id"]
	flag := false
	

	// Find quote with matching ID
	for _, quote := range quotes {
		if quote.ID == id {
			// Set headers and send response
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(quote)
			flag = true
			return
		}
	}

	if flag == false{
	json.NewEncoder(w).Encode(map[string]string{"status": "Error has occured"})
	return
	
	}

}
func getQuotes(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "appication/")
	json.NewEncoder(w).Encode(quotes)
}
func addQuote(w http.ResponseWriter, r *http.Request) {
	fmt.Println("HomePage")
}
func deleteQuote(w http.ResponseWriter, r *http.Request) {
	fmt.Println("HomePage")
}
func editQuote(w http.ResponseWriter, r *http.Request) {
	fmt.Println("HomePage")
}
func handleRoutes(){
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/getquote/{id}", getQuote).Methods("GET")
	router.HandleFunc("/getquotes", getQuotes).Methods("GET")
	router.HandleFunc("/addquote", addQuote).Methods("POST")
	router.HandleFunc("/deletequote/{id}", deleteQuote).Methods("DELETE")
	router.HandleFunc("/editquote/{id}", editQuote).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8090", router))
	//Tutorial 1:55:03
}

func main() {
	allQuotes()
	handleRoutes()
	fmt.Println(quotes)
}
