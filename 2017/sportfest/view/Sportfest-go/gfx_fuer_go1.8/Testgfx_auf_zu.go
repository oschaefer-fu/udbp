package main

import "./gfx"
import "time"

func main () {
	gfx.Fenster(640,480)
	gfx.Linie (0,0,100,100)
	time.Sleep (2 * 1000 * 1000 * 1000)
	gfx.FensterAus ()
	println (gfx.FensterOffen())
	gfx.Fenster(800,600)
	gfx.Linie(0,599,799,0)
	time.Sleep (5 * 1000 * 1000 * 1000)
}
