//
//  NumberGuessingViewController.swift
//  Test game
//
//  Created by Дмитрий Бессонов on 18.06.2022.
//

import UIKit

class NumberGuessingViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var guessingTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    private let namesForButtons = NamesForButtons ()
    
    let minValue = 1
    let maxValue = 100
    lazy var valuesRange = minValue...maxValue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessingTextField.delegate = self
        
        enterButton.isUserInteractionEnabled = false
        
        setButton()
    }
    
    
    // MARK: - Setting Button
    
    func setButton() {
        enterButton.setTitle(namesForButtons.enter, for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.backgroundColor = .blue
        enterButton.layer.cornerRadius = 10
        enterButton.alpha = 0.1
    }
    
    
    
    // MARK: - TextField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if newText.isEmpty {
            return true
        }
        
        let characterCount = textField.text?.count ?? 0
        if characterCount >= 0 {
            enterButton.isUserInteractionEnabled = true
            enterButton.alpha = 1
        }
        
        return valuesRange.contains(Int(newText) ?? minValue - 1)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}



extension NumberGuessingViewController {
    

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
