//
//  FightTeam.swift
//  TransformerGame
//
//  Created by Chenguo Yan on 2018-08-22.
//  Copyright © 2018 Chenguo Yan. All rights reserved.
//

import UIKit

class FightTeam: NSObject {
    
    var team: TransformerType
    var transformers = [Transformer]()
    
    var sortedTransformers: [Transformer] {
        return self.transformers.sorted{ $0.specs.overallRating > $1.specs.overallRating }
    }
    
    enum GameResult {
        case win
        case lose
        case equal
        case notAvailable
    }
    
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
    func playGame(with opponentTeam: FightTeam, numOfBattles: inout Int)
    {
        var index = 0
        let upperBoundary = opponentTeam.sortedTransformers.count - 1
        
        for transformer in self.sortedTransformers
        {
            if index > upperBoundary  {
                break
            }
            transformer.fight(with: opponentTeam.sortedTransformers[index])
            print("Overall Rating: \(transformer.specs.overallRating),\(transformer.isKilled) ----\(opponentTeam.sortedTransformers[index].specs.overallRating) \(opponentTeam.sortedTransformers[index].isKilled)")
            index += 1
            numOfBattles += 1
        }
        if self.numOfKilled > opponentTeam.numOfKilled {
            
        }
    }

}
