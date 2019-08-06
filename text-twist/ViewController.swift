//
//  ViewController.swift
//  text-twist
//
//  Created by David Rifkin on 8/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var currentGame: TestTwistInfo? {
        didSet {
            showAvailableLettersLabel.text = self.currentGame?.letters
        }
    }
    
    @IBOutlet weak var showAvailableLettersLabel: UILabel!
    @IBOutlet weak var userGuessMessageLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var threeLettersTextView: UITextView!
    
    @IBOutlet weak var fourLettersTextView: UITextView!
    
    @IBOutlet weak var fiveLettersTextView: UITextView!
    
    @IBOutlet weak var sixLettersTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        currentGame = pickNewGame()
        // Do any additional setup after loading the view.
    }
    //define a method from the delegate protocol that DOES SOMETHING when i hit enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")
        return true
    }
    
    private func pickNewGame() -> TestTwistInfo {
        return WordData.getGameInfo()
    }

    private func addAnswerToTextView(answer: String) {
        switch answer.count {
        case 3:
            threeLettersTextView.text.append(answer)
        case 4:
            fourLettersTextView.text.append(answer)
        case 5:
            fiveLettersTextView.text.append(answer)
        case 6:
            sixLettersTextView.text.append(answer)
        default:
            print("oh well")
        }
    }
}

