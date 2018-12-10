//
//  Model.swift
//  CoreDataApp
//
//  Created by Konstantin Kalivod on 12/9/18.
//  Copyright © 2018 Kostya Kalivod. All rights reserved.
//

import Foundation

class MyModel {
    
    // MARK: - Random String
class func randomString(length: Int) -> String {
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    var randomString = ""
    
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
}
    // MARK: - Generator Random Strings
    class func generatorRandomStrings(length: Int) -> Array<String> {
        var array = [String]()
        for _ in 0 ... length {
            print(randomString(length: 5))
            array.append(randomString(length: 5))
        }
        return array
    }
    // MARK: - Data Sampling from generator
    //sampling by the presence of 'a' in the array
    class func dataSampling (inputArray: Array<String>) -> Array<String>{
        var array = [String]()
        for target in inputArray{
            if target.range(of:"a") != nil
            {
                array.append(target)
                print("MyDataArray = \(array)")
            }
            else
            {
                print("There no a")
            }
            
        }
        
        return array
    }
    
}
