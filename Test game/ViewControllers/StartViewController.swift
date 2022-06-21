//
//  ViewController.swift
//  Test game
//
//  Created by Дмитрий Бессонов on 15.06.2022.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    private let namesForLabels = NamesForLabels ()
    private let namesForButtons = NamesForButtons ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabels()
        setButtons()
    }
    
    
    
    //MARK: - Setting Labels and Buttons
    
    func setLabels() {
        headerLabel.text = namesForLabels.headerGame
    }

    func setButtons() {
        startGameButton.setTitle(namesForButtons.start, for: .normal)
        startGameButton.setTitleColor(.white, for: .normal)
        startGameButton.backgroundColor = .blue
        startGameButton.layer.cornerRadius = 10
    }
}

