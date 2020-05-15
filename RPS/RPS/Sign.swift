//
//  Sign.swift
//  RPS
//
//  Created by Student on 2020-05-08.
//  Copyright © 2020 Student. All rights reserved.
//
import GameplayKit
import Foundation

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1{
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self{
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func turn(_ player: Sign) -> gameState {
        switch self {
        
        case .rock:
            switch player {
            case .rock:
                return gameState.draw
            case .paper:
                return gameState.lose
            case .scissors:
                return gameState.win
            }
        
        case .paper:
            switch player {
            case .rock:
                return gameState.win
            case .paper:
                return gameState.draw
            case .scissors:
                return gameState.lose
            }
        
        case .scissors:
            switch player {
            case .rock:
                return gameState.lose
            case .paper:
                return gameState.win
            case .scissors:
                return gameState.draw
            }
        }
    }
}
