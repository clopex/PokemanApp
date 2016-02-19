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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
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

}
