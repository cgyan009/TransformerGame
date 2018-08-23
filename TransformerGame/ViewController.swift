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
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var numberOfBattlesLabel: UILabel!
    @IBOutlet weak var winingTeamLabel: UILabel!
    @IBOutlet weak var survivingMemebersTextView: UITextView!
    
    lazy var teamAutobot = FightTeam(team: TransformerType.autobot)
    lazy var teamDeception = FightTeam(team: TransformerType.deception)
    
    var isGameOver: Bool = false {
        didSet {
            self.playButton.isEnabled = !isGameOver
        }
    }
    
    var numOfBattles = 0 {
        didSet {
            self.numberOfBattlesLabel.text = "\(numOfBattles)"
            
        }
    }
    var winningTeam: String {
        if teamAutobot.numOfKilled < teamDeception.numOfKilled {
            return teamAutobot.team.rawValue
        } else if teamAutobot.numOfKilled > teamDeception.numOfKilled {
            return teamDeception.team.rawValue
        } else {
            return "equal"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.survivingMemebersTextView.isUserInteractionEnabled = false
        setupTeams()
    }
    
    private func setupTeams() {
        let a1 = Transformer(name: "A1",
                             specs: TransformerSpecs(strength:7, intelligence: 4, speed: 4, endurance: 4, rank: 4, courage: 7, firepower: 4, skill: 6),
                             transformerType: TransformerType.autobot)
        let a2 = Transformer(name: "Optimus Prime",
                             specs: TransformerSpecs(strength: 2, intelligence: 3, speed: 4, endurance: 5, rank: 6, courage: 7, firepower: 8, skill: 9),
                             transformerType: TransformerType.autobot)
        
        let a3 = Transformer(name: "Optimus Prime",
                             specs: TransformerSpecs(strength: 1, intelligence: 1, speed: 1, endurance: 1, rank: 1, courage: 1, firepower: 1, skill: 1),
                             transformerType: TransformerType.autobot)
    

        let d1 = Transformer(name: "Optimus Prime1",
                             specs: TransformerSpecs(strength: 4, intelligence: 4, speed: 4, endurance: 9, rank: 4, courage: 4, firepower: 4, skill: 4),
                             transformerType: TransformerType.autobot)
     
        let d2 = Transformer(name: "D2",
                             specs: TransformerSpecs(strength: 2, intelligence: 3, speed: 4, endurance: 5, rank: 4, courage: 7, firepower: 8, skill: 9),
                             transformerType: TransformerType.autobot)
        let d3 = Transformer(name: "D3",
                             specs: TransformerSpecs(strength: 2, intelligence: 3, speed: 4, endurance: 1, rank: 4, courage: 7, firepower: 8, skill: 9),
                             transformerType: TransformerType.autobot)
      
        teamAutobot.enrollTeamMembers(memebers: [a1, a2, a3])
        teamDeception.enrollTeamMembers(memebers: [d1, d2, d3])
        
    }
    
    @IBAction func playGame(_ sender: Any)
    {
        self.numOfBattles = 0
        teamAutobot.playGame(with: teamDeception, numOfBattles: &self.numOfBattles)
        print("Autobot killed: \(teamAutobot.numOfKilled)")
        print("Deception killed: \(teamDeception.numOfKilled)")
        self.isGameOver = true
        print("----")
        
    }
    
    private func displayLosingTeamSurvivingMembers() {
        
    }
    
}

