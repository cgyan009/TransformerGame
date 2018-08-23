//
//  FightTeam.swift
//  TransformerGame
//
//  Created by Chenguo Yan on 2018-08-22.
//  Copyright © 2018 Frank Yan. All rights reserved.
//

import UIKit

enum GameResult {
    case win
    case lose
    case equal
    case notPlayed
}

class FightTeam: NSObject
{
    var team: TransformerType
    var transformers = [Transformer]() //the members of the team
    
    var sortedTransformers: [Transformer] {
        return self.transformers.sorted{ $0.specs.overallRating > $1.specs.overallRating }
    }
    
    var gameResult: GameResult = GameResult.notPlayed
    var numOfKilled: Int {
        return self.transformers.filter{ $0.isKilled == true}.count
    }
    var survivingMembers: [Transformer] {
        return self.transformers.filter{ $0.isKilled == false }
    }
    
    init(team: TransformerType) {
        self.team = team
    }
    func enrollTeamMembers(memebers: [Transformer]) {
        self.transformers = memebers
    }
    private func killAll() {
        self.transformers.forEach { $0.isKilled = true }
    }
    //fight with opponent team
    func playGame(with opponentTeam: FightTeam, numOfBattles: inout Int)
    {
        var index = 0
        let upperBoundary = opponentTeam.sortedTransformers.count - 1
        let superNames = ["Optimus Prime", "Predaking"]
        
        for transformer in self.sortedTransformers
        {
            if index > upperBoundary  {
                break
            }
            //if the fighters named "Optimus Prime" or "Predaking" met, then gaveover
            //kill all fighters
            if superNames.contains(transformer.name) &&
                superNames.contains(opponentTeam.sortedTransformers[index].name)
            {
                self.gameResult = GameResult.equal
                opponentTeam.gameResult = GameResult.equal
                self.killAll()
                opponentTeam.killAll()
                return
            }
            transformer.fight(with: opponentTeam.sortedTransformers[index])
            index += 1
            numOfBattles += 1
        }
        //judge the game result
        if self.numOfKilled > opponentTeam.numOfKilled {
            self.gameResult = GameResult.lose
            opponentTeam.gameResult = GameResult.win
        } else if self.numOfKilled < opponentTeam.numOfKilled {
            opponentTeam.gameResult = GameResult.lose
            self.gameResult = GameResult.win
        } else {
            self.gameResult = GameResult.equal
            opponentTeam.gameResult = GameResult.equal
        }
    }
}
