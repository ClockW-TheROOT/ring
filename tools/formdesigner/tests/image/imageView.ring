# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.11 Form Designer
# Date : 17/09/2019
# Time : 20:29:16

Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new imageView { win.show() } 
		exec()
	}
}

class imageView from WindowsViewParent
	win = new MainWindow() { 
		move(10,53)
		resize(400,400)
		setWindowTitle("Image")
		setstylesheet("background-color:;") 
		Image1 = new label(win) {
			move(47,93)
			resize(296,158)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("Arial")
			setfont(oFont)
			oFont.delete()
			setPixMap(New qPixMap("thering.jpg"))
			
		}
	}

# End of the Generated Source Code File...