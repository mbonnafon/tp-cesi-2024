package main

import "testing"

func TestToLower(t *testing.T) {
	tests := []struct {
		input    string
		expected string
	}{
		{"HELLO WORLD", "hello world"},
		{"GoLang", "golang"},
		{"123 ABC xyz", "123 abc xyz"},
		{"MIXED case LETters", "mixed case letters"},
		{"", ""},
	}

	for _, test := range tests {
		t.Run(test.input, func(t *testing.T) {
			output := toLower(test.input)
			if output != test.expected {
				t.Errorf("toLower(%q) = %q; want %q", test.input, output, test.expected)
			}
		})
	}
}
