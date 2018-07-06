package main

import "gfx"
import "time"
import "math"
import "fmt"


type ball struct {
	x,y,w,v float64 // Mittelpunktskoordinaten, Winkel, Geschwindigkeit
	radius uint16   // Radius
	r,g,b uint8    // Farbe
	xa,ya uint16  //alte Grafikkoordianten 
}
func NewBall (x,y,w,v float64, radius uint16 ,r,g,b uint8) (*ball) {
	bptr:= new (ball)
	bptr.x = x; bptr.y = y ; bptr.w = w; bptr.v = v
	bptr.radius = radius
	bptr.r = r; bptr.g = g; bptr.b = b
	return bptr
}

func (b *ball) bewegen () {
	// Berechnung der neuen Koordinaten
	b.xa = uint16(b.x)
	b.ya = uint16(b.y)
	if b.w>0 && b.w < 180 && b.y <= float64(b.radius)  { //Anstoß oben
		b.w =  360 - b.w
	}
	if (b.w>270 || b.w < 90) && b.x >= float64(gfx.Grafikspalten()-1) -float64(b.radius) { //Anstoß rechts
		b.w = (180 - b.w + 360 )
		if b.w >=360 { b.w = b.w - 360 }
	}
	if b.w>180 && b.w < 360 && b.y >= float64(gfx.Grafikzeilen()-1) - float64(b.radius) { //Anstoß unten
		b.w = 360 - b.w
	}
	if b.w > 90 && b.w < 270 && b.x <= float64(b.radius) { //Anstoß links
		b.w = (180 - b.w + 360 ) 
		if b.w >=360 { b.w = b.w - 360 }
	}
	
	b.x = b.x + math.Cos (b.w * math.Pi/180)
	b.y = b.y - math.Sin (b.w * math.Pi/180)
}

func (b *ball) neuzeichnen () {
	gfx.Stiftfarbe (0xFF,0xFF,0xFF)
	gfx.Vollkreis (uint16(b.xa),uint16(b.ya),b.radius)
	gfx.Stiftfarbe (b.r,b.g,b.b)
	gfx.Vollkreis (uint16(b.x),uint16(b.y),b.radius)
}

func baelle_bewegen (b [](*ball)) {
	for {
		//1. Schritt: neue Positionen der Bälle.
		for i:=0; i < len (b) ; i++ {
			b[i].bewegen ()
		}
		//2. Schritt: Bälle darstellen
		gfx.UpdateAus ()
		for i:=0; i < len (b) ; i++ {
			b[i].neuzeichnen ()
		}
		gfx.UpdateAn ()
		//3.Schritt: Warten ...
		time.Sleep (time.Duration(1 * 1.0e6)) 
	}
}

func main () {
	var b [](*ball)
	//Fenster auf
	gfx.Fenster (800,600)   //NEU: Fenstergröße muss angegeben werden!!
	//Bälle erzeugen 
	b1:= NewBall (300,300,10,20,20,0xFF,0,0)
	b = append (b,b1)
	b2:= NewBall (300,300,50,20,20,0,0xFF,0)
	b = append (b,b2)
	b3:= NewBall (300,300,70,20,20,0,0,0xFF)
	b = append (b,b3)
	b4:= NewBall (300,300,100,20,20,0,0xFF,0xFF)
	b = append (b,b4)
	b5:= NewBall (300,300,130,20,20,0xFF,0xFF,0)
	b = append (b,b5)
	b6:= NewBall (300,300,150,20,20,0xFF,0,0xFF)
	b = append (b,b6)
	fmt.Println (len (b), "Bälle bewegen sich im Fenster!")

	//Bälle bewegen ...
	go baelle_bewegen (b)
	
	//Haupprogramm wartet auf ENTER
	fmt.Scanln ()
}
