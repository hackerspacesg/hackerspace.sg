// Kai Hendry
package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"time"
)

type event struct {
	Name string
	When string
}

type events []event

var errUnparseableTimestamp = errors.New("unparsable timestamp")

var timeFormats = []string{
	time.RFC3339Nano,
	"2006-01-02",
}

// From https://github.com/dustin/seriesly/blob/master/time.go
func parseTime(in string) (time.Time, error) {
	for _, f := range timeFormats {
		parsed, err := time.Parse(f, in)
		if err == nil {
			return parsed, nil
		}
	}
	return time.Time{}, errUnparseableTimestamp
}

func main() {

	pJSON := struct {
		Feed struct {
			Entry []struct {
				When []struct {
					StartTime string
				} `json:"gd$when"`
				Title struct {
					T string `json:"$t"`
				}
			}
		}
	}{}

	hsgevents := events{}
	j, _ := ioutil.ReadAll(os.Stdin)
	_ = json.Unmarshal(j, &pJSON)
	// fmt.Printf("%+v\n", pJSON)
	//fmt.Println(pJSON.Feed.Entry[0].When[0].StartTime)
	for _, v := range pJSON.Feed.Entry {
		// fmt.Printf("%+v\n", v.When)
		// fmt.Printf("%+v\n", v.Title)
		if len(v.When) > 0 {
			t, err := parseTime(v.When[0].StartTime)
			if err != nil {
				panic(err)
			}
			// fmt.Println(t)
			if t.After(time.Now()) {
				hsgevents = append(hsgevents, event{v.Title.T, t.Format(time.RFC3339)})
			}
		}
	}

	b, _ := json.MarshalIndent(hsgevents, "", "    ")
	fmt.Println(string(b))

}
