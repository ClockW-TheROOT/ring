# Project : CalmoSoft Questions Game
# Date    : 28/03/2020-10:49:26
# Author  : Gal Zsolt (~ CalmoSoft ~)
# Email   : calmosoft@gmail.com

load "stdlib.ring"
load "guilib.ring"
load "questions.ring"

numQuestion = len(Questions)
numAnswer = len(Questions[1][2])
btnAnswer = list(numAnswer)
randQuestion = 0
C_Spacing = 1
fontsize = 15

New qApp {

        stylefusionblack()

        win = new qWidget() {

                setwindowtitle("Questions Game")

                LayoutButtonMain = new QVBoxLayout() {
                	setSpacing(C_SPACING)
                        setContentsmargins(100,100,100,100) 
		}

                LayoutButtonRow1 = new QHBoxLayout()
                LayoutButtonRow2 = new QVBoxLayout()
                LayoutButtonRow3 = new QVBoxLayout()

                LayoutButtonRow = new QVBoxLayout() {
			setSpacing(C_SPACING)
			setContentsmargins(10,10,10,10) 
		}


 		labelQuestion = new QLabel(win) {
			setFont(new qFont("Verdana",fontsize,50,0))
			settext("Question:")
	        }

		labelNewQuestion = new QLabel(win) {
			setFont(new qFont("Verdana",fontsize,50,0))
		}

		btnNewQuestion = new qpushbutton(win) {
			setFont(new qFont("Verdana",fontsize,50,0))
			setText("New question")
			setClickEvent("NewQuestion()")
		}

                LayoutButtonRow1 {
			AddWidget(labelQuestion)
			AddWidget(labelNewQuestion)
			AddWidget(btnNewQuestion)
		}

 		labelAnswer = new QLabel(win) {
			setFont(new qFont("Verdana",fontsize,50,0))
			settext("Answers:")
		}

                LayoutButtonRow2.AddWidget(labelAnswer)

                for n = 1 to numAnswer
			btnAnswer[n] = new qpushbutton(win) {
				setFont(new qFont("Verdana",fontsize,50,0))
				setclickevent("CheckAnswer(" + string(n) + ")")                                  
			}
			LayoutButtonRow2.AddWidget(btnAnswer[n])
                next

		btnExit = new QPushButton(win) {
			setFont(new qFont("Verdana",fontSize,50,0))
			setClickEvent("CloseApp()")
			settext("Exit")
		}

                LayoutButtonRow2.AddWidget(btnExit)

		labelYourAnswer = new QLabel(win) {
			setFont(new qFont("Verdana",fontsize,50,0))
			settext("Your Answer:")
		}   

		btnYourAnswer = new QLabel(win) {
			setFont(new qFont("Verdana",fontsize,50,0))
		}

                LayoutButtonRow3 {
			AddWidget(labelYourAnswer)
			AddWidget(btnYourAnswer)
		}

                LayoutButtonMain {
			AddLayout(LayoutButtonRow)
			AddLayout(LayoutButtonRow1)
			AddLayout(LayoutButtonRow2)
			AddLayout(LayoutButtonRow3)
		}

                setLayout(LayoutButtonMain)

                ShowFullScreen()
                NewQuestion()

        }

        exec()
}

func NewQuestion()
	btnYourAnswer.settext("")
	randQuestion = random(len(Questions)-1) + 1
	labelNewQuestion.settext(Questions[randQuestion][1])
	tempAnswer = Questions[randQuestion][2]
	for n = 1 to numAnswer
		btnAnswer[n].settext(tempAnswer[n])
	next 

func CheckAnswer(nr)
	btnYourAnswer.settext(btnAnswer[nr].text())
	if Questions[randQuestion][3] = nr
		msgBox("Good Answer!")
	else
		msgBox("Bad Answer! Try again")
	ok

func msgBox(cText)	  
	mb = new qMessageBox(win) {
		setWindowTitle('Questions Game')
		setText(cText)
		setstandardbuttons(QMessageBox_OK) 
		result = exec() 
	}

func CloseApp()
	win.close()
