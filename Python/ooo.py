#!/usr/bin/env python3

import base64

def twentysix(o):
	return thirtytwo(o, twentyseven('o'*92))

def twentyfive(o):
	return thirtytwo(o, twentyseven('o'*222))

def twentyfour(o):
	return thirtytwo(o, twentyseven('o'*26))

def twentythree(o):
	return thirtytwo(o, twentyseven('o'*183))

def twentytwo(o):
	return thirtytwo(o, twentyseven('o'*245))

def twentyone(o):
	return thirtytwo(o, twentyseven('o'*254))

def twenty(o):
	return thirtytwo(o, twentyseven('o'*161))

def nineteen(o):
	return thirtytwo(o, twentyseven('o'*196))

def eighteen(o):
	return thirtytwo(o, twentyseven('o'*38))

def sixteen(o):
	return thirtytwo(o, twentyseven('o'*200))

def fifteen(o):
	return thirtytwo(o, twentyseven('o'*194))

def fourteen(o):
	return thirtytwo(o, twentyseven('o'*170))

def thirteen(o):
	return thirtytwo(o, twentyseven('o'*43))

def twelve(o):
	return thirtytwo(o, twentyseven('o'*104))

def eleven(o):
	return thirtytwo(o, twentyseven('o'*103))

def ten(o):
	return thirtytwo(o, twentyseven('o'*253))

def nine(o):
	return thirtytwo(o, twentyseven('o'*152))

def eight(o):
	return thirtytwo(o, twentyseven('o'*183))

def seven(o):
	return thirtytwo(o, twentyseven('o'*215))

def six(o):
	return thirtytwo(o, twentyseven('o'*221))

def five(o):
	return thirtytwo(o, twentyseven('o'*97))

def four(o):
	return thirtytwo(o, twentyseven('o'*60))

def three(o):
	return thirtytwo(o, twentyseven('o'*197))

def two(o):
	return thirtytwo(o, twentyseven('o'*145))

def one(o):
	return thirtytwo(o, twentyseven('o'*74))

def thirtytwo(o, oo):
    return [ twentynine(thirty(thirtyone) ^ oo) for thirtyone in o ]

def thirty(o):
    return ord(o)

def twentynine(o):
    return chr(o)

def twentyeight(o):
    return ''.join(one(two(three(four(five(six(seven(eight(nine(ten(eleven(twelve(thirteen(fourteen(fifteen(sixteen(eighteen(nineteen(twenty(twentyone(twentytwo(twentythree(twentyfour(twentyfive(twentysix(o))))))))))))))))))))))))))

def twentyseven(o):
    return len(o)

eo = base64.b64encode(bytes(twentyeight(open("flag.txt", "r").read().strip()), 'utf-8')).decode('utf-8')

print("The flag has been protected: {}".format(eo))
print("Can you recover it?")
#flag = "hello"
flag = base64.b64decode("OTsxAxtMSkAbHRlJSR0ZSk0ZHUsZTR4eSksZHh1NGwU=").strip().decode('utf-8')
flagger = twentysix(twentyfive(twentyfour(twentythree(twentytwo(twentyone(twenty(nineteen(eighteen(sixteen(fifteen(fourteen(thirteen(twelve(eleven(ten(nine(eight(seven(six(five(four(three(two(one(str(flag))))))))))))))))))))))))))
flaggest = ""
for i in range(0, len(flagger)):
   flaggest += flagger[i]
print(flaggest)