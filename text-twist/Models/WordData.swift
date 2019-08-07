//
//  WordData.swift
//  text-twist
//
//  Created by David Rifkin on 8/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
import UIKit

class WordData {
    //   static constant -> WordData.allInfo
    static let allInfo: [TestTwistInfo] = [
        //26
        TestTwistInfo(wordCount: 1,
                      letters: "cdenno",
                      words: ["conned", "coden","coned", "donne", "nonce","code","coed","cone","conn","deco","done","neon","node","none","once", "cod","con","den","doc","doe","don","end","eon","nod","ode","one"],
                      letterDictionary: getLetterDictionary(userInput: "cdenno"), count: 0
                      ),
        // 17
        TestTwistInfo(wordCount: 1,
                      letters: "ehhssu",
                      words: ["hushes", "shush", "hehs","hues","hush","shes","sues","uses", "ess","heh","hes","hue","huh","she","shh","sue","use"],
                      letterDictionary: getLetterDictionary(userInput: "ehhssu"), count: 0),
        //13
        TestTwistInfo(wordCount: 1,
                      letters: "hisswy",
                      words: ["swishy", "hissy","swish", "hiss","whys","wish","wiss","ywis", "his","shy","sis","why","wis"],
                      letterDictionary: getLetterDictionary(userInput: "ehhssu"), count: 0),
    ]
    static func getGameInfo() -> TestTwistInfo {
        return allInfo.randomElement()!
    }
    
    static func getLetterDictionary(userInput: String) -> [Character:Int] {
        var userInputDict = [Character: Int]()
        
        for char in userInput {
            if let charCount = userInputDict[char] {
                userInputDict[(char)] = charCount + 1
            } else {
                userInputDict[char] = 1
            }
        }
        return userInputDict
    }
    
    
}
