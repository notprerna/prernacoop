//
//  ViewController.swift
//  RPS
//
//  Created by Student on 2020-05-08.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        // Do any additional setup after loading the view.
 }
    @IBOutlet weak var computerSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockButtonSelected(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func paperButtonSelected(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func scissorsButtonSelected(_ sender: Any) {
        play(Sign.scissors)
    }
    @IBAction func playAgainButtonSelected(_ sender: Any) {
        resetGame()
    }
    
    func play(_ playersTurn: Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        let opponent = randomSign()
        computerSign.text = opponent.emoji
        
        let gameResult = playersTurn.turn(opponent)
        
        switch gameResult {
        case .draw:
            gameStatus.text = "It's a draw!"
        case .win:
            gameStatus.text = "You Won!"
        case .lose:
            gameStatus.text = "You Lost!"
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
        }
        
        paperButton.isHidden = true
        rockButton.isHidden = true
        scissorsButton.isHidden = true
        switch playersTurn {
            case .rock:
            rockButton.isHidden = false
            case .paper:
            paperButton.isHidden = false
            case .scissors:
            scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }
    
    func resetGame() {
        computerSign.text = "🤖"
        gameStatus.text = "Rock, Paper, Scissors?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden =  false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
        
    }

}

