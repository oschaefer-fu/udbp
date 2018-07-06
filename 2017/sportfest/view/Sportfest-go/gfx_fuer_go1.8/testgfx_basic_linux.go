package main

import "gfx"
import "fmt"
import "time"

func main () {
	gfx.Fenster (800,600)  //NEU: Fenstergröße muss angegeben werden!! 08.02.2014
	gfx.Stiftfarbe (0x10,0xFF,0x80)
	gfx.Linie(0,0,gfx.Grafikspalten()-1,gfx.Grafikzeilen ()-1)
	r,g,b:= gfx.GibPunktfarbe(0,0)
	fmt.Println ("Farbe von Pixel (0,0):",r,g,b)
	gfx.Rechteck (100,10,50,50)
	gfx.Vollrechteck (110,20,30,30)
	gfx.Stiftfarbe (0xFF,0xB0,0)
	gfx.Kreis (200,35,25)
	gfx.Vollkreis (200,35,15)
	gfx.Stiftfarbe (0xFF,0,0)
	gfx.Kreissektor (270,35,25,135,405)
	gfx.Vollkreissektor (270,35,15,135,405)
	r,g,b = gfx.GibPunktfarbe(270,35)
	fmt.Println ("Farbe von Pixel (270,35):",r,g,b)
	gfx.Stiftfarbe (0,0xFF,0)
	gfx.Dreieck (330,10,390,10,360,70)
	gfx.Volldreieck (340,17,380,17,360,57)
	for i:=uint16(0);i<=255;i++ {
		gfx.Stiftfarbe (uint8(0xFF-i),0,uint8(i))
		gfx.Linie(20,80+i,60,80+i)
	}
	gfx.Stiftfarbe (0,0,0)
	gfx.Schreibe (100,100,"Das ist ein SDL-Grafikfenster !!")
	gfx.Stiftfarbe (255,0,0)
	gfx.SetzeFont("/usr/local/go/fonts/LiberationSerif-Regular.ttf",48)
	gfx.SchreibeFont(100,140,"Hallöle Welt!")
	gfx.SetzeFont("/usr/local/go/fonts/LiberationSans-Bold.ttf",96)
	gfx.Stiftfarbe (0,255,0)
	gfx.SchreibeFont(100,180,"Hallo Welt!")
	gfx.Stiftfarbe (0,0,255)
	gfx.SetzeFont("/usr/local/go/fonts/LiberationMono-Regular.ttf",120)
	gfx.SchreibeFont(100,280,"SUPER!!")
	println ("Die blaue Schrift ist: ")
	println (gfx.GibFont()) //Ausgabe des aktuellen Fonts
	gfx.Clipboard_kopieren (100,10,50,50)
	gfx.Clipboard_einfuegen (500,10)
	gfx.Archivieren ()
	time.Sleep (2 * 1000 * 1000 * 1000)
	for i:=uint16(20); i<=400; i++ {
		gfx.Restaurieren (510,i-1,30,1)
		gfx.Stiftfarbe (uint8(uint32(i) * 255 / 400),0,uint8(255 - uint32(i)* 255 / 400))
		gfx.Vollrechteck(510,i,30,30)
		time.Sleep (5 * 1000 * 1000)
	}
	for i:=uint16(400); i>=20; i-- {
		gfx.Restaurieren (510,i+30,30,1)
		gfx.Stiftfarbe (uint8(uint32(i) * 255 / 400),0,0)
		gfx.Vollrechteck (510,i,30,30)
		time.Sleep (5 * 1000 * 1000)
	}
	
	gfx.Stiftfarbe(0xFF,0,0)
	gfx.Schreibe (500,440,"COUNT DOWN ...")	
	for i:=uint16(7); i>0;i-- {
		gfx.Schreibe (500+(7-i)*20,460,fmt.Sprint(i))
		time.Sleep (1 * 1000 *1000 *1000)
	}
}



