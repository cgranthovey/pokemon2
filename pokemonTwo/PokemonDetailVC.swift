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
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
    }


}
