package main

import (
	"fmt"
)

func main() {
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
