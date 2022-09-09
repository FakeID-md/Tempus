import sys
import os
from datetime import datetime, timezone
import functools
import traceback
import re


def logger(func):

    def wrapper(*args, **kwargs):


        result = func(*args, **kwargs)
        time = datetime.now(timezone.utc)
        if result and len(result) > 1:

            '''
            result[0], result[1] -> input variables
            result[2] -> output value
            '''

            info = "{} - ({}, {}) ==> {} {}".format(time, result[0], result[1], result[2], type(result[2]))
        else:
            info = "{} - ({})==>{}".format(time, type(result), str(result))

        logMessage = "[LOG] - " + str(func) + info
        print(logMessage)

        

        # Write log messages to target file
        with open("log.txt", "a") as file:
            file.write("%s\n" % logMessage)


        return logMessage



    return wrapper

   
@logger
def add(x, y):
    
    return (x, y, x + y)

@logger
def substract(x, y):
    
    return (x, y, x-y)

@logger
def multiply(x, y):
    
    return (x, y, x * y)

@logger
def divide(x, y):

    try:

        result = (x, y, x / y)

    except ZeroDivisionError as e:

        stackTrace = [ ]
        exType = sys.exc_info()[0]
        stackTrace.append(exType.__name__)
        return stackTrace


    return result


@logger
def cat(file):

    stackTrace = [ ]

    try:

        with open(file) as f:
            for line in f:
                print(line)

    except FileNotFoundError as e:

        # Get info about the exception
        exType = sys.exc_info()[0]
        stackTrace.append(exType.__name__)
        #print("ERROR")

    #print(stackTrace)

    return stackTrace


def main():

    add(1, 2)
    multiply(999, 9999)
    cat("numbers1.txt")
    cat("test.txt")
    divide(1, 1)


if __name__ == "__main__":

    main()



def testAdd():

   assert "[LOG]" and " - (3, 5) ==> 8 <class 'int'>" in add(3, 5)
   

def testSubstract():

    assert "[LOG]" and " - (3, 3) ==> 0 <class 'int'>" in substract(3, 3)



def testMultiply():

    assert "[LOG]" and " - (1, 2) ==> 2 <class 'int'>" in multiply(1, 2)




def testDivide():

    assert "[LOG]" and " - (4, 2) ==> 2.0 <class 'float'>" in divide(4, 2)
    assert "[LOG]" and "(<class 'list'>)==>['ZeroDivisionError']" in divide(1, 0)




def testCat():

    assert "[LOG]" and "(<class 'list'>)==>['FileNotFoundError']" in cat("test.txt")
    assert "[LOG]" and "(<class 'list'>)==>[]" in cat("numbers1.txt")