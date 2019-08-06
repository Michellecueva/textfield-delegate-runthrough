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
        if let inputText = inputTextField.text {
            let result = currentGame?.verifyGuess(guess: inputText) ?? false
            if result {
                userGuessMessageLabel.text = "correct"
                addAnswerToTextView(answer: inputText)
            } else {
                userGuessMessageLabel.text = "incorrect guess never give up"
            }
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //what is the argument string? it's whatever we've typed into the text field.
        if (currentGame?.letters.contains(string) ?? false) || string == ""  {
            return true
        } else {
            return false
        }
        //look through the letters and see if the last input matched them
        //if the last letter that was typed is not in arrayLetters, it should not appear
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

