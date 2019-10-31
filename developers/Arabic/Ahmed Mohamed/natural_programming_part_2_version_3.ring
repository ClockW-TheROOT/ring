/*
	Application	: Natural Programming Part 2 Version 3
	Author		: Ahmed Mohamed
	Date		: 2019/10/30
*/

new sum {
	1 2 3
	4 5 6
	7 8 9
}

new mul {
	1 2 3
	4 5 6
	7 8 9
}


class mul from program

	func braceEnd
		nMul = 1
		for nNumber in aList
			nMul = nMul * nNumber
		next
		? "Mul : " + nMul


class sum from program

	func braceEnd
		nSum = 0
		for nNumber in aList
			nSum = nSum + nNumber
		next
		? "Sum : " + nSum

class program

	aList = []

	func braceExprEval value
		if isNumber(value)
			aList + value
		ok
	

