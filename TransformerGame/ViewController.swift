//
//  ViewController.swift
//  TransformerGame
//
//  Created by Chenguo Yan on 2018-08-22.
//  Copyright © 2018 Chenguo Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var numberOfBattlesLabel: UILabel!
    @IBOutlet weak var winingTeamLabel: UILabel!
    @IBOutlet weak var survivingMemebersTextView: UITextView!
    
    lazy var teamAutobot = FightTeam(team: TransformerType.autobot)
    lazy var teamDeception = FightTeam(team: TransformerType.deception)
    
    var numOfBattles = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupTeams() {
        let a1 = Transformer(name: "A1",
                             specs: TransformerSpecs(strength:7, intelligence: 4, speed: 4, endurance: 4, rank: 4, courage: 7, firepower: 4, skill: 6),
                             transformerType: TransformerType.autobot)
        let a2 = Transformer(name: "Optimus Prime",
                             specs: TransformerSpecs(strength: 2, intelligence: 3, speed: 4, endurance: 5, rank: 6, courage: 7, firepower: 8, skill: 9),
                             transformerType: TransformerType.autobot)
    

        let d1 = Transformer(name: "Optimus Prime1",
                             specs: TransformerSpecs(strength: 4, intelligence: 4, speed: 4, endurance: 9, rank: 4, courage: 4, firepower: 4, skill: 4),
                             transformerType: TransformerType.autobot)
     
        let d2 = Transformer(name: "D2",
                             specs: TransformerSpecs(strength: 2, intelligence: 3, speed: 4, endurance: 5, rank: 4, courage: 7, firepower: 8, skill: 9),
                             transformerType: TransformerType.autobot)
      
        teamAutobot.enrollTeamMembers(memebers: [a1])
        teamDeception.enrollTeamMembers(memebers: [d1])
        
    }
    
    @IBAction func playGame(_ sender: Any) {
        
        setupTeams()
        
        let sortedAutobot = teamAutobot.transformers.sorted{ $0.specs.overallRating > $1.specs.overallRating }
        let sortedDeception = teamDeception.transformers.sorted{ $0.specs.overallRating > $1.specs.overallRating }
        sortedAutobot[0].fight(with: sortedDeception[0])
        var index = 0
        sortedAutobot.forEach { (transformer) in
            
            transformer.fight(with: sortedDeception[index])
            
            print("Overall Rating: \(transformer.specs.overallRating),\(transformer.isKilled) ----\(sortedDeception[index].specs.overallRating) \(sortedDeception[index].isKilled)")
            index += 1
        }
        print("----")
       
    }
    
}

