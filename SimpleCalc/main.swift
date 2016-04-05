//
//  main.swift
//  SimpleCalc
//
//  Created by iGuest on 4/5/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import Foundation

/*
*
*
*
*/
func input() -> String{
    let keyboard = NSFileHandle.fileHandleWithStandardInput();
    let inputData = keyboard.availableData;
    return NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String;
}

func computation() {
    print("Please Insert Your Computation :");
    let firstPassUI = input();
    var firstPassArray = firstPassUI.characters.split{$0 == " "}.map(String.init);
    print(firstPassUI);
    
    if(firstPassArray.count == 1) {
        //Take the new line char off of the value
        let trimmedDouble = removeNewline(firstPassArray[0]);
        //print("\(trimmedDouble)");
        let doubleString:Double? = Double(trimmedDouble);
        operationComputation(doubleString!);
    }
}

func operationComputation(numberOne: Double) {
    print("Please add an Operator :");
    let operatorString = removeNewline(input());
    print("Insert an Additional Operand :");
    let numberTwo:Double? = Double(removeNewline(input()));
    if (operatorString == "+") {
        print("\(numberOne) + \(numberTwo!) = \(numberOne + numberTwo!)");
    } else if (operatorString == "-") {
        print("\(numberOne) - \(numberTwo!) = \(numberOne - numberTwo!)");
    } else if (operatorString == "/") {
        print("\(numberOne) / \(numberTwo!) = \(numberOne / numberTwo!)");
    } else if (operatorString == "%") {
        print("\(numberOne) % \(numberTwo!) = \(numberOne % numberTwo!)");
    } else {
        print("Please use one of the accepted operators: + - / %")
    }
}

func removeNewline(newlineString: String) -> String {
    var trimmedString = newlineString;
    let range = trimmedString.endIndex.advancedBy(-1)..<trimmedString.endIndex;
    trimmedString.removeRange(range);
    return trimmedString;
}

computation();
//print("Please Type in Your Name :");
//
//var userInput = input();
//
//let firstPassUI = userInput.characters.split{$0 == " "}.map(String.init);
//firstPassUI.last
//
//let text = "text"
//
//    
//print("\(userInput)");
//
//var herpInput = input();
//
//print("\(herpInput)");
//
//print(firstPassUI);

