package main

import "gfx"
import "time"

func main () {
	gfx.Fenster(300,300)
	gfx.Linie(10,10,290,290)
	gfx.SpieleSound ("vader.wav")
	time.Sleep(6e9)
	gfx.SpieleSound("jabba.wav")
	time.Sleep(6e9)
	gfx.FensterAus()
}
