//
//  ScoresViewController.swift
//  Test game
//
//  Created by Дмитрий Бессонов on 18.06.2022.
//

import UIKit

class ScoresViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var playerScoresLabel: UILabel!
    @IBOutlet weak var computerScoresLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    private let namesForLabels = NamesForLabels ()
    private let namesForButtons = NamesForButtons ()
    
    var playerTries = 0
    var computerTries = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabels()
        setButtons()
        result()
    }
    
    
    func result() {
        if playerTries > computerTries {
            winLabel.text = namesForLabels.computerWin
        } else if computerTries > playerTries {
            winLabel.text = namesForLabels.playerWin
        } else {
            winLabel.text = namesForLabels.draw
        }
    }
    
    //MARK: - Setting Labels and Buttons
    
    func setLabels() {
        playerScoresLabel.text = namesForLabels.playerTries + String(playerTries)
        computerScoresLabel.text = namesForLabels.computerTries + String(computerTries)
        headerLabel.text = namesForLabels.scores
    }
    func setButtons() {
        menuButton.setTitle(namesForButtons.start, for: .normal)
        menuButton.setTitleColor(.white, for: .normal)
        menuButton.backgroundColor = .blue
        menuButton.layer.cornerRadius = 10
    }
}
