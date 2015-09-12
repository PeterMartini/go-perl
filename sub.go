package main

import "C"

//export sub
func sub(a int, b int) int {
    return a - b
}

func main() {}
