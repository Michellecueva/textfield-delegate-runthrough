//
//  TestTwistInfo.swift
//  text-twist
//
//  Created by David Rifkin on 8/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

protocol SomethingWithAWordCount {
    var wordCount: Int {get set}
}

struct TestTwistInfo: SomethingWithAWordCount {
    var wordCount: Int
    
    let letters: String
    let words: [String]
}
