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
    
    private var minValue = 1
    private var maxValue = 100
    lazy var valuesRange = minValue...maxValue
    
    var computerTries = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerVariantTextField.delegate = self
        computerAnswerLabel.text = ""
        setLabels()
        setButtons()
    }
    
    //MARK: - Setting Labels and Buttons
    
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
    
    
    // MARK: - Actions
    
    @IBAction func guessButtonAction(_ sender: Any) {
        
        if let number: Int = Int(playerVariantTextField.text!) {
            
            switch number {
            case randomNumber :
                performSegue(withIdentifier: "playerToScoreSegue", sender: nil)
            case (randomNumber + 1)...maxValue:
                maxValue = number
                tryNumber += 1
                computerAnswerLabel.text = namesForLabels.computerAnswerLess
                setLabels()
            case minValue...(randomNumber - 1):
                minValue = number
                tryNumber += 1
                computerAnswerLabel.text = namesForLabels.computerAnswerMore
                setLabels()
            default:
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "playerToScoreSegue" else { return }
        guard let scoresVC = segue.destination as? ScoresViewController else { return }
        scoresVC.playerTries = tryNumber
        scoresVC.computerTries = computerTries
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

//MARK: - Extension

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
