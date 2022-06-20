//
//  PlayerGuesingViewController.swift
//  Test game
//
//  Created by Дмитрий Бессонов on 18.06.2022.
//

import UIKit

class PlayerGuesingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tryNumberLabel: UILabel!
    @IBOutlet weak var playerGuessingLabel: UILabel!
    @IBOutlet weak var playerVariantTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var computerAnswerLabel: UILabel!
    
    private let namesForLabels = NamesForLabels ()
    private let namesForButtons = NamesForButtons ()
    private var tryNumber = 1
    
    private var randomNumber = Int.random(in: 1...100)
    
    let minValue = 1
    let maxValue = 100
    lazy var valuesRange = minValue...maxValue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerVariantTextField.delegate = self
        
        setLabels()
        setButtons()
    }
    
    
    func setLabels() {
        tryNumberLabel.text = namesForLabels.tryNumber + String(tryNumber)
        playerGuessingLabel.text = namesForLabels.playerGuessing
    }
    
    func setButtons() {
        guessButton.setTitle(namesForButtons.guess, for: .normal)
        guessButton.setTitleColor(.white, for: .normal)
        guessButton.backgroundColor = .blue
        guessButton.layer.cornerRadius = 10
    }
    
    @IBAction func guessButtonAction(_ sender: Any) {
//        let number = randomNumber
//        if Int(playerGuessingLabel.text ?? "") == number {
//            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                guard segue.identifier == "playerToScoreSegue" else { return }
//                guard let scoresVC = segue.destination as? ScoresViewController else { return }
//                scoresVC.playerScoresLabel.text = String(tryNumber)
//        }
//        } else if Int(playerGuessingLabel.text ?? "") ?? 1 < number {
//            tryNumber += 1
//            computerAnswerLabel.text = namesForLabels.computerAnswerLess
//            setLabels()
//        } else if Int(playerGuessingLabel.text ?? "") ?? 1 > number {
//            tryNumber += 1
//            computerAnswerLabel.text = namesForLabels.computerAnswerMore
//            setLabels()
//        }
    }
    
    // MARK: - TextField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if newText.isEmpty {
            return true
        }
        
        let characterCount = textField.text?.count ?? 0
        if characterCount >= 0 {
        }
        
        return valuesRange.contains(Int(newText) ?? minValue - 1)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}



extension PlayerGuesingViewController {
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.keyboardType = .asciiCapableNumberPad
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
