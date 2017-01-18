//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Dominique Paster on 1/17/17.
//  Copyright © 2017 Dominique Paster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let lowerBound = 1
    let upperBound = 100
    var numToGuess: Int!
    var numOfGuesses = 0
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessResponse: UILabel!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt=Int(guess){
                numOfGuesses = numOfGuesses+1
                print(guessInt)
                checkGuess(guessInt)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Generate Random Number
        genRandomNumber()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func genRandomNumber(){
        numToGuess = Int(arc4random_uniform(100))+1
    }
    func checkGuess(_ guess:Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
//            guessResponse.text = "Your guess should be between 1 and 100!"
//            guessResponse.textColor = UIColor.red
        } else if guess < numToGuess {
            guessResponse.text = "Higher! ⬆️"
            guessResponse.textColor = UIColor.red
        } else if guess > numToGuess {
            guessResponse.text = "Lower! ⬇️"
            guessResponse.textColor = UIColor.red
        } else {
//            guessResponse.text = "You win!"
//            guessResponse.textColor = UIColor.green
            showWinAlert()
            numOfGuesses = 0
            genRandomNumber()
            guessResponse.textColor=UIColor.black
            guessResponse.text = "Guess"
        }
    }
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Invalid Entry", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! 🎉", message: "You won with a total of \(numOfGuesses) guesses", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }


}

