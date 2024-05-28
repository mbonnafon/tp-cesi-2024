package main

import (
	"fmt"
	"net/http"
	"strings"
)

func toLower(text string) string {
	return strings.ToLower(text)
}

func userAgentHandler(w http.ResponseWriter, r *http.Request) {
	userAgent := r.Header.Get("User-Agent")
	fmt.Fprintf(w, "User-Agent: %s\n", userAgent)
}

func main() {
	http.HandleFunc("/", userAgentHandler)
	fmt.Println("Starting server at port 8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Println("Error starting server:", err)
	}
}
