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
    
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        currentGame = pickNewGame()
        resetButton.isHidden = true
        
        // Do any additional setup after loading the view.
    }

   
    @IBAction func Resets(_ sender: UIButton) {
        resetButton.isHidden = true
        inputTextField.isEnabled = true
        currentGame = pickNewGame()
        userGuessMessageLabel.text = ""
        inputTextField.text = ""
        threeLettersTextView.text = ""
        fourLettersTextView.text = ""
        fiveLettersTextView.text = ""
        sixLettersTextView.text = ""
    }
    //define a method from the delegate protocol that DOES SOMETHING when i hit enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let inputText = inputTextField.text {
            
            let result = currentGame?.verifyGuess(guess: inputText) ?? false
            if result {
                userGuessMessageLabel.text = "correct"
                addAnswerToTextView(answer: inputText)
            } else {
                userGuessMessageLabel.text = "incorrect guess "
            }
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        userGuessMessageLabel.text = ""
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let newString = text.replacingCharacters(in: textRange, with: string)
           
            if newString.count < text.count || newString == "" {
               print(newString)
                if let newStringLast = newString.last {
                    showAvailableLettersLabel.text = String(newStringLast)
//                    checkLetters(inputText: String(newStringLast))
                }
        
                

            }
        }

        //what is the argument string? it's whatever we've typed into the text field.
        if (currentGame?.letters.contains(string) ?? false) || string == ""  {
            checkLetters(inputText: string)
            
           return true
        } else {
            userGuessMessageLabel.text = "Cannot use the letter \(string)"
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
            if !threeLettersTextView.text.contains(answer){
                threeLettersTextView.text.append("\(answer)\n")
                currentGame?.addToCount()
                
                
            } else {
                userGuessMessageLabel.text = "Already Guessed. Try again!"
            }
        case 4:
            if !fourLettersTextView.text.contains(answer){
                fourLettersTextView.text.append("\(answer)\n")
                currentGame?.addToCount()
            } else {
                userGuessMessageLabel.text = "Already Guessed. Try again!"
            }
        case 5:
            if !fiveLettersTextView.text.contains(answer){
                fiveLettersTextView.text.append("\(answer)\n")
                currentGame?.addToCount()
            } else {
                userGuessMessageLabel.text = "Already Guessed. Try again!"
            }
        case 6:
            if !sixLettersTextView.text.contains(answer){
                sixLettersTextView.text.append("\(answer)\n")
                currentGame?.addToCount()
            } else {
                userGuessMessageLabel.text = "Already Guessed. Try again!"
            }
        default:
            print("oh well")
        }
        if currentGame?.count == currentGame?.wordCount {
            userGuessMessageLabel.text = "Congrats! You got them all!"
            inputTextField.isEnabled = false
            resetButton.isHidden = false
           
        }
    }
    
    func checkLetters(inputText: String ) -> String {
        if let currentWord = (currentGame?.letters.contains(inputText)){ //safe unwrap
            switch currentWord {
            case true:
                if let index = showAvailableLettersLabel.text?.firstIndex(of: Character(inputText)) {
                    showAvailableLettersLabel.text?.remove(at: index)
                }
                
            case false:
                showAvailableLettersLabel.text = currentGame?.letters
                
            }
            
            
        }
        return showAvailableLettersLabel.text!
        
    }
    
    
   
}

