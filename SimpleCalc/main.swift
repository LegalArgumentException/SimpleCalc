//
//  main.swift
//  SimpleCalc
//
//  Created by Tanner on 4/5/16.
//  Copyright © 2016 Tanner. All rights reserved.
//
//  This program allows a user to input commands in order to do simple operations such as addition, multiplication
//  subtraction and modulation. It also supports averaging, counting, and computing factorials. All operations except
//  factorial support the input of doubles and negative numbers. The program will continue to cycle until the user
//  specifies they do not want to continue playing.

import Foundation

// Contains logic that prints out computations and instructions depending on the input the
// user provides. Returns True if the user wants to continue inputting computations and
// False if they want to terminate the program
func computation() -> Bool {
    print("Please Insert Your Computation :");
    let firstPassUI = input();
    let firstPassArray = firstPassUI.characters.split{$0 == " "}.map(String.init);
    let firstPassEndIndex = removeNewline((firstPassArray.last)!);
    if(firstPassArray.count == 1) {
        let trimmedDouble = removeNewline(firstPassArray[0]);
        let doubleString:Double? = Double(trimmedDouble);
        operationComputation(doubleString!);
    // Test and Logic for count
    } else if (firstPassEndIndex.lowercaseString == "count") {
        print("The count is : \(firstPassArray.count - 1)");
    } else if (firstPassEndIndex.lowercaseString == "avg") {
        let avgRange = 0...firstPassArray.count-2;
        var sum = 0.0;
        for indexNumber in avgRange {
            let doubleString:Double! = Double(firstPassArray[indexNumber]);
            sum += doubleString;
        }
        print("The average is :  \(sum / Double(avgRange.count - 1))");
    } else if (firstPassEndIndex.lowercaseString == "fact") {
        if(firstPassArray.count != 2) {
            print("Please format a factorial call with the given format : '[Integer] fact'");
        } else {
            print("\(factorial(Int(firstPassArray[0])!))");
        }

    } else {
        print("You put in an invalid query");
    }
    return continueQuery();
}

// Contains the logic for simple addition, subtraction, division, multiplication,
// and modulation - printing out information to the user as is appropriate
func operationComputation(numberOne: Double) {
    print("Please add an Operator :");
    let operatorString = removeNewline(input());
    print("Insert an Additional Operand :");
    let numberTwo:Double? = Double(removeNewline(input()));
    if (operatorString == "+") {
        print("\(numberOne) + \(numberTwo!) = \(numberOne + numberTwo!)");
    } else if (operatorString == "-") {
        print("\(numberOne) - \(numberTwo!) = \(numberOne - numberTwo!)");
    } else if (operatorString == "*") {
        print("\(numberOne) * \(numberTwo!) = \(numberOne * numberTwo!)");
    } else if (operatorString == "/") {
        print("\(numberOne) / \(numberTwo!) = \(numberOne / numberTwo!)");
    } else if (operatorString == "%") {
        print("\(numberOne) % \(numberTwo!) = \(numberOne % numberTwo!)");
    } else {
        print("Please use one of the accepted operators: + - / %")
    }
}

// Removes the last two characters of whatever String is passed in, returning the resulting
// String
func removeNewline(newlineString: String) -> String {
    var trimmedString = newlineString;
    let range = trimmedString.endIndex.advancedBy(-1)..<trimmedString.endIndex;
    trimmedString.removeRange(range);
    return trimmedString;
}

// Given an Int, returns an Int that is the result of a factorial operation on the Int 
// passed in
func factorial(factInt: Int) -> Int {
    if(factInt <= 1) {
        return 1;
    } else {
        return factInt * factorial(factInt - 1);
    }
}

// Queries the user on whether or not they want to complete another operation. Returns True
// if they respond with yes and False if they respond with no
func continueQuery() -> Bool {
    print("Would you like to make another query?");
    var continueAnswer = "";
    // Continue asking the user if they want to make another query until they answer "yes" or "no"
    while (continueAnswer.lowercaseString != "yes" && continueAnswer.lowercaseString != "no") {
        print("Please answer 'Yes' or 'No'");
        continueAnswer = removeNewline(input());
    }
    return (continueAnswer.lowercaseString == "yes");
    
}

// Returns an NSString depending on what the user inputs using the keyboard
func input() -> String{
    let keyboard = NSFileHandle.fileHandleWithStandardInput();
    let inputData = keyboard.availableData;
    return NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String;
}

// Starts the cycle of computations, and terminates once the user decides they want to stop

var cycle = true;

while cycle {
    cycle = computation();
}


