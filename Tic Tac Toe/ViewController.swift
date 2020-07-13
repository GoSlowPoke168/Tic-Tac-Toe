//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jeremy on 7/11/20.
//  Copyright © 2020 Jeremy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameBoard: UIImageView!
    @IBOutlet var button: [UIButton]!
    
    var activePlayer = 1 // 1 = circle, 2 = cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 = empty, 1 = circle, 2 = cross
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var activeGame = true
    
    @IBAction func playAgainButtonClicked(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlayer = 1
        activeGame = true
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
            playAgainButton.isHidden = true
            winnerLabel.isHidden = true
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
            UIView.animate(withDuration: 1, animations: {
                self.gameBoard.alpha = 1
                for i in 1..<10 {
                    if let button = self.view.viewWithTag(i) as? UIButton {
                        button.alpha = 1
                    }
                }
            })
            
        }
    }
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false

                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Circles won!"
                    } else {
                        winnerLabel.text = "Crosses won!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        self.gameBoard.alpha = 0.1
                        for i in 1..<10 {
                            if let button = self.view.viewWithTag(i) as? UIButton {
                                button.alpha = 0.1
                            }
                        }
                    })
                }
            }
            if gameState[0] != 0 && gameState[1] != 0 && gameState[2] != 0 && gameState[3] != 0 && gameState[4] != 0 && gameState[5] != 0 && gameState[6] != 0 && gameState[7] != 0 && gameState[8] != 0 && activeGame{
                activeGame = false
                winnerLabel.isHidden = false
                playAgainButton.isHidden = false
                self.winnerLabel.text = "It's a Tie!"
                UIView.animate(withDuration: 1, animations: {
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    self.gameBoard.alpha = 0.1
                    for i in 1..<10 {
                        if let button = self.view.viewWithTag(i) as? UIButton {
                            button.alpha = 0.1
                        }
                    }
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isHidden = true
        winnerLabel.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        gameBoard.alpha = 1
        for i in 1..<10 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.alpha = 1
            }
        }
    }


}

