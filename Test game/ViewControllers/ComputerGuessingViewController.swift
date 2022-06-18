//
//  ComputerGuessingViewController.swift
//  Test game
//
//  Created by Дмитрий Бессонов on 18.06.2022.
//

import UIKit

class ComputerGuessingViewController: UIViewController {
    
    
    @IBOutlet weak var tryNumberLabel: UILabel!
    @IBOutlet weak var computerGuessingLabel: UILabel!
    @IBOutlet weak var computerVariantLabel: UILabel!
    @IBOutlet weak var moreLessLabel: UILabel!
    @IBOutlet weak var lessButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    private let namesForLabels = NamesForLabels ()
    private let namesForButtons = NamesForButtons ()
    private var tryNumber = 1
    private var number = 100
    private var randomNumber = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabels()
        setButtons()
    }
    
    func setLabels() {
        tryNumberLabel.text = namesForLabels.tryNumber + String(tryNumber)
        computerGuessingLabel.text = namesForLabels.computerGuessing
        computerVariantLabel.text = namesForLabels.computerVariant + String(randomNumber) + "?"
        moreLessLabel.text = namesForLabels.moreLess
    }
    
    
    func setButtons() {
        lessButton.setTitle(namesForButtons.less, for: .normal)
        lessButton.setTitleColor(.black, for: .normal)
        lessButton.backgroundColor = .white
        lessButton.layer.cornerRadius = 10
        lessButton.layer.borderWidth = 1
        lessButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        
        equalButton.setTitle(namesForButtons.equal, for: .normal)
        equalButton.setTitleColor(.black, for: .normal)
        equalButton.backgroundColor = .white
        equalButton.layer.cornerRadius = 10
        equalButton.layer.borderWidth = 1
        equalButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        
        moreButton.setTitle(namesForButtons.more, for: .normal)
        moreButton.setTitleColor(.black, for: .normal)
        moreButton.backgroundColor = .white
        moreButton.layer.cornerRadius = 10
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func lessButtonAction(_ sender: Any) {
        number = randomNumber
        randomNumber = Int.random(in: 1...number)
        tryNumber += 1
        setLabels()
    }
    @IBAction func equalButtonAction(_ sender: Any) {
        
        
    }
    
    @IBAction func moreButtonAction(_ sender: Any) {
        number = randomNumber
        randomNumber = Int.random(in: number...100)
        tryNumber += 1
        setLabels()
    }
    
}
