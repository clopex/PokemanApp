//
//  Pokeman.swift
//  Pokeman
//
//  Created by Adis Mulabdic on 2/17/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import Foundation

class Pokeman {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
}