//
//  Transformer.swift
//  TransformerGame
//
//  Created by Frank Yan on 2018-08-22.
//  Copyright © 2018 Frank Yan. All rights reserved.
//

import Foundation

struct TransformerSpecs
{
    private let minVal = 1
    private let maxVal = 10
    
    private var _strength: Int
    private var _intelligence: Int
    private var _speed: Int
    private var _endurance: Int
    private var _rank: Int
    private var _courage: Int
    private var _firepower: Int
    private var _skill: Int
    
    var strength: Int {
        return self._strength
    }
    var intelligence: Int {
        return self._intelligence
    }
    var speed: Int {
        return self._speed
    }
    var endurance: Int {
        return self._endurance
    }
    var rank: Int {
        return self._rank
    }
    var courage: Int {
        return self._courage
    }
    var firepower: Int {
        return self._firepower
    }
    var skill: Int {
        return self._skill
    }
    var overallRating: Int {
        return _strength + _intelligence + _speed + _endurance + _firepower
    }
    init(strength: Int,
         intelligence: Int,
         speed: Int,
         endurance: Int,
         rank: Int,
         courage: Int,
         firepower: Int,
         skill: Int) {
        //specs can only be 1-10
        self._courage = min(max(courage, minVal), maxVal)
        self._endurance = min(max(endurance, minVal), maxVal)
        self._firepower = min(max(firepower, minVal), maxVal)
        self._intelligence = min(max(intelligence, minVal), maxVal)
        self._rank = min(max(rank, minVal), maxVal)
        self._skill = min(max(skill, minVal), maxVal)
        self._speed = min(max(speed, minVal), maxVal)
        self._strength = min(max(strength, minVal), maxVal)
    }
}
enum TransformerType: String {
    case autobot = "Autobot"
    case deception = "Deception"
}

class Transformer : NSObject
{
    var name: String
    var transformerType: TransformerType
    var isKilled = false
    var specs: TransformerSpecs
    
    init(name: String, specs:TransformerSpecs, transformerType: TransformerType) {
        self.name = name
        self.transformerType = transformerType
        self.specs = specs
    }
    //2 transforms fight with each other
    func fight(with opponent: Transformer)
    {
        //with these names are super strong
        let superNames = ["Optimus Prime", "Predaking"]
        if superNames.contains(self.name) && !superNames.contains(opponent.name) {
            opponent.isKilled = true
            return
        }
        if !superNames.contains(self.name) && superNames.contains(opponent.name) {
            self.isKilled = true
            return
        }
        
        let courageDown = self.specs.courage - opponent.specs.courage
        let strengthDown = self.specs.strength - opponent.specs.strength
        
        if courageDown >= 4 && strengthDown >= 3 {
            opponent.isKilled = true
            return
        } else if courageDown <= -4 && strengthDown <= -3 {
            self.isKilled = true
            return
        }
        
        let skillDif = self.specs.skill - opponent.specs.skill
        if skillDif >= 3 {
            opponent.isKilled = true
            return
        } else if skillDif <= -3 {
            self.isKilled = true
            return
        }
        
        if self.specs.overallRating > opponent.specs.overallRating {
            opponent.isKilled = true
            return
        } else if self.specs.overallRating < opponent.specs.overallRating {
            self.isKilled = true
            return
        } else {
            self.isKilled = true
            opponent.isKilled = true
        }
    }
}
