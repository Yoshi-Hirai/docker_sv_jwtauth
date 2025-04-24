package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, Docker with Go!")
	})
	http.ListenAndServe(":8080", nil)
}
