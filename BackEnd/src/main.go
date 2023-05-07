package main

import (
	"fmt"
	"database/sql"
	"net/http"
	"log"
	"encoding/json"
	"github.com/gorilla/mux"
	"crypto/rand"
	"encoding/hex"
	"time"
	_ "github.com/lib/pq"

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

// This is done with DB
func getQuote(w http.ResponseWriter, r *http.Request) {
	quoteId := mux.Vars(r)
	id := quoteId["id"]


	var quote Quotes
	err := db.QueryRow("SELECT id, quote, author, date FROM inspiration WHERE id = $1", id).Scan(&quote.ID, &quoteQ.Quote, &quote.Author,&quote.Date )
	if err != nil {
		if err == sql.ErrNoRows {
			http.NotFound(w, r)
			return
		}
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Set headers and send response
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(book)

}
// This is done with DB connection
func getQuotes(w http.ResponseWriter, r *http.Request) {
	rows, err := db.Query("SELECT id, quote, author, date FROM inspiration")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	// Convert rows to array of books
	var quotes []Quotes
	for rows.Next() {
		var quote Quotes
		err = rows.Scan(&quote.ID, &quote.Quote, &quote.Author, &quote.Date)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		quotes = append(quotes, quote)
	}

	// Set headers and send response
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(books)

}
//this is done with DB
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

	err = db.QueryRow("INSERT INTO books(id, quote, author, date) VALUES($1, $2, $3, $4)", quote.ID, quote.Quote, quote.Author, quote.Date)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	
	// Send response
	w.WriteHeader(http.StatusCreated)

}
//This is done with DB
func deleteQuote(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	id := params["id"]

	res, err := db.Exec("DELETE FROM inspiration WHERE id = $1", id)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Check if book was deleted
	rowsAffected, err := res.RowsAffected()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	if rowsAffected == 0 {
		http.NotFound(w, r)
		return
	}

	// Send success response
	w.WriteHeader(http.StatusNoContent)

}

func editQuote(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	id := params["id"]
	quote := params["quote"]
	author := params["author"]
	lastUpdated := time.Now()

	// Parse request body to get updated book data
	var updateQuote Quotes
	err := json.NewDecoder(r.Body).Decode(&updateQuote)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Update book in database
	res, err := db.Exec("UPDATE inspiration SET quote = $1, author = $2, last_updated = $3 WHERE id = $4",
		updateQuote.Quote, updateQuote.Author, updateQuote.Date id)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Check if book was updated
	rowsAffected, err := res.RowsAffected()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	if rowsAffected == 0 {
		http.NotFound(w, r)
		return
	}

	// Send success response with updated book data
	updateQuote.ID = id
	updateQuote.Quote = quote
	updateQuote.Author = author
	updateQuote.Date = lastUpdated
	json.NewEncoder(w).Encode(updatedBook)
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

var db *sql.DB

func main() {

	var err error
	db, err = sql.Open("postgres", "postgres://user:password@localhost/bookstore?sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()


	allQuotes()
	handleRoutes()
	fmt.Println(quotes)
}
