//
//  Pokeman.swift
//  Pokeman
//
//  Created by Adis Mulabdic on 2/17/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import Foundation
import Alamofire

class Pokeman {
    private var _name: String!
    private var _pokedexId: Int!
    private var _desc: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _atttack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionId: String!
    private var _pokemonUrl: String!
    private var _nextEvolutionLvl: String!
    
    var description: String {
        
        if _desc == nil {
            _desc = ""
        }
        return _desc
    }
    
    var type: String {
        
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var weight: String {
        
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height: String {
        
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var attack: String {
        
        if _atttack == nil {
            _atttack = ""
        }
        return _atttack
    }
    
    var nextEvolutionTxt: String {
        
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
    }
    
    var nextevolutinId: String {
        
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nexteolutionLvl: String {
        
        if _nextEvolutionLvl == nil {
            _nextEvolutionLvl = ""
        }
        return _nextEvolutionLvl
    }
    
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "http://pokeapi.co/api/v1/pokemon/\(self._pokedexId)"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                //print(dict)
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._atttack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._weight)
                print(self._height)
                print(self._atttack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                    
                } else {
                    
                    self._type = ""
                }
                
                print(self._type)
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        
                        let nsurl = NSURL(string: "http://pokeapi.co\(url)")!
                        
                        
                        Alamofire.request(.GET, nsurl).responseJSON { (response) -> Void in
                            
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                if let decscription = descDict["description"] as? String {
                                    
                                    self._desc = decscription
                                    print(self._desc)
                                }
                            }
                            
                            completed()
                        }
                    }
                } else {
                    self._desc = ""
                }
                
                if let evolution = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolution.count > 0{
                    
                    if let to = evolution[0]["to"] as? String {
                        
                        if to.rangeOfString("mega") == nil {
                            
                            if let uri = evolution[0]["resource_uri"] as? String {
                                
                                let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvolutionId = num
                                self._nextEvolutionTxt = to
                                
                                if let lvl = evolution[0]["level"] as? Int {
                                    self._nextEvolutionLvl = "\(lvl)"
                                }
                                
                                print(self._nextEvolutionLvl)
                                print(self._nextEvolutionTxt)
                                print(self._nextEvolutionId)
                                
                            }
                        }
                    }
                    
                }
                
                
                
            }
        }
        
    }
    
}















