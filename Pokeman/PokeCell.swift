//
//  PokeCell.swift
//  Pokeman
//
//  Created by Adis Mulabdic on 2/17/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokeman: Pokeman!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokeman: Pokeman) {
        self.pokeman = pokeman
        
        nameLbl.text = self.pokeman.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokeman.pokedexId)")
    }
    
    
    
}
