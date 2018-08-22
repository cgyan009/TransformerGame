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
    
    init(team: TransformerType) {
        self.team = team
    }
    func enrollTeamMembers(memebers: [Transformer]) {
        self.transformers += memebers
    }

}
