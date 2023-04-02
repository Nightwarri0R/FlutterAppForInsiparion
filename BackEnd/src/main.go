package main

import (
	"fmt"
	"net/http"
	"log"
	"encoding/json"
	"github.com/gorilla/mux"
	"crypto/rand"
	"encoding/hex"
	"time"

)
type Quotes struct {
	ID     string `json:"id"`
	Quote  string `json:"quote"`
	Author string `json:"author"`
	Date   string `json:"date"`
}
func generateID(length int) (string, error) {
	bytes := make([]byte, length)
	_, err := rand.Read(bytes)
	if err != nil {
		return "", err
	}
	return hex.EncodeToString(bytes), nil
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

// This is done 
func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("HomePage")
}

// This is done 
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
// This is done 
func getQuotes(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "appication/")
	json.NewEncoder(w).Encode(quotes)
	fmt.Println(quotes)

}
func addQuote(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	// Parse request body
	var quote Quotes
	err := json.NewDecoder(r.Body).Decode(&quote)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	quote.ID, err = generateID(10)
	// Generate unique ID for quotes
	if err != nil {
		panic(err)
	}
	
	currentDate := time.Now()
	quote.Date = currentDate.Format("2006-01-02")

	// Add book to slice
	quotes = append(quotes, quote)

	// Send response
	w.WriteHeader(http.StatusCreated)

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
	router.HandleFunc("/addquote/{quote}{author}", addQuote).Methods("POST")
	router.HandleFunc("/deletequote/{id}", deleteQuote).Methods("DELETE")
	router.HandleFunc("/editquote/{id}", editQuote).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8090", router))
}

func main() {
	allQuotes()
	handleRoutes()
	fmt.Println(quotes)
}
