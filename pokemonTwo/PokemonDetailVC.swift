//
//  PokemonDetailVC.swift
//  pokemonTwo
//
//  Created by Chris Hovey on 6/3/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var pokeDesc: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
    }

    
    @IBAction func backBtnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
