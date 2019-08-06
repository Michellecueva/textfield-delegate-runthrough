//
//  ViewController.swift
//  text-twist
//
//  Created by David Rifkin on 8/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
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
        // Do any additional setup after loading the view.
    }
    //define a method from the delegate protocol that DOES SOMETHING when i hit enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")
        return true
    }
}

