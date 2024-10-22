package main

import (
	"encoding/json"
	"fmt"
	"log"
)

func main() {
    input := `{ "a": 3 }`

    var target map[string]any

    err := json.Unmarshal([]byte(input), &target)

    if err != nil {
        log.Fatalf("Couldn't parse json: %s", err)
    }

    for k, v := range target {
        fmt.Printf("%s: %v", k, v)
    }
}
