//
//  PokemanDetailVC.swift
//  Pokeman
//
//  Created by Adis Mulabdic on 2/19/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class PokemanDetailVC: UIViewController {

    var pokemon: Pokeman!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var currentImg: UIImageView!
    @IBOutlet weak var nextImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var wightLbl: UILabel!
    @IBOutlet weak var baseAttack: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        
        var img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done!!
            
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        descLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexId)"
        wightLbl.text = pokemon.weight
        baseAttack.text = pokemon.attack
        
        
        if pokemon.nextevolutinId == "" {
            evoLbl.text = "No Evloutions"
            nextImg.hidden = true
        } else {
            nextImg.hidden = false
            nextImg.image = UIImage(named: pokemon.nextevolutinId)
            var str = "Next Evloution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nexteolutionLvl != "" {
                str += " - LVL \(pokemon.nexteolutionLvl)"
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
