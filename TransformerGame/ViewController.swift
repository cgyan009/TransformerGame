//
//  ViewController.swift
//  TransformerGame
//
//  Created by Frank Yan on 2018-08-22.
//  Copyright © 2018 Frank Yan. All rights reserved.
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
            if isGameOver {
                self.displayWinningTeam()
                self.displaySurvivingMeembersOfLosingTeam()
            }
        }
    }
    
    var numOfBattles = 0 {
        didSet {
            self.numberOfBattlesLabel.text = "\(numOfBattles)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.survivingMemebersTextView.isUserInteractionEnabled = false
        setupTeams()
    }
    //setup team for the game
    private func setupTeams() {
        let a1 = Transformer(name: "Bluestreak",
                             specs: TransformerSpecs(strength:6,
                                                     intelligence: 6,
                                                     speed: 7,
                                                     endurance: 9,
                                                     rank: 5,
                                                     courage: 2,
                                                     firepower: 9,
                                                     skill: 7),
                             transformerType: TransformerType.autobot)
        let a2 = Transformer(name: "Hubcap",
                             specs: TransformerSpecs(strength: 4,
                                                     intelligence: 4,
                                                     speed: 4,
                                                     endurance: 4,
                                                     rank: 4,
                                                     courage: 4,
                                                     firepower: 4,
                                                     skill: 4),
                             transformerType: TransformerType.autobot)
        
        let a3 = Transformer(name: "Optimus Prime",
                             specs: TransformerSpecs(strength: 1,
                                                     intelligence: 1,
                                                     speed: 1,
                                                     endurance: 1,
                                                     rank: 1,
                                                     courage: 1,
                                                     firepower: 1,
                                                     skill: 1),
                             transformerType: TransformerType.autobot)
    
        let d1 = Transformer(name: "Soundwave",
                             specs: TransformerSpecs(strength: 8,
                                                     intelligence: 9,
                                                     speed: 2,
                                                     endurance: 6,
                                                     rank: 7,
                                                     courage: 5,
                                                     firepower: 6,
                                                     skill: 10),
                             transformerType: TransformerType.deception)
     
        let d2 = Transformer(name: "Predaking1",
                             specs: TransformerSpecs(strength: 2,
                                                     intelligence: 3,
                                                     speed: 4,
                                                     endurance: 5,
                                                     rank: 4,
                                                     courage: 7,
                                                     firepower: 8,
                                                     skill: 9),
                             transformerType: TransformerType.deception)
        let d3 = Transformer(name: "D3",
                             specs: TransformerSpecs(strength: 2,
                                                     intelligence: 3,
                                                     speed: 4,
                                                     endurance: 1,
                                                     rank: 4,
                                                     courage: 7,
                                                     firepower: 8,
                                                     skill: 9),
                             transformerType: TransformerType.deception)
      
        teamAutobot.enrollTeamMembers(memebers: [a1, a2])
        teamDeception.enrollTeamMembers(memebers: [d1])
        
    }
    
    @IBAction func playGame(_ sender: Any)
    {
        self.numOfBattles = 0
        teamAutobot.playGame(with: teamDeception, numOfBattles: &self.numOfBattles)
        self.isGameOver = true
    }
    
    private func displayWinningTeam() {
        
        if teamAutobot.gameResult == GameResult.win {
            self.winingTeamLabel.text = teamAutobot.team.rawValue
        } else if teamDeception.gameResult == GameResult.win {
            self.winingTeamLabel.text = teamDeception.team.rawValue
        } else {
            self.winingTeamLabel.text = "equal"
        }
    }
    
    private func displaySurvivingMeembersOfLosingTeam() {
        var survivingMembers = [Transformer]()
        if teamAutobot.gameResult == GameResult.lose {
            survivingMembers = teamAutobot.survivingMembers
        } else if teamDeception.gameResult == GameResult.lose {
            survivingMembers = teamDeception.survivingMembers
        }
        if survivingMembers.count > 0 {
            survivingMembers.forEach { (item) in
                self.survivingMemebersTextView.text.append(item.name + "\r\n")
            }
        } else {
            self.survivingMemebersTextView.text.append("no survivors")
        }
    }
}

