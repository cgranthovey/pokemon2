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
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var attack: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
        let currentPokemonImage = UIImage(named: "\(pokemon.pokedexId)")
        img.image = currentPokemonImage
        currentEvoImg.image = currentPokemonImage
        pokemon.downloadPokemonDetails { () -> () in
            //called once download is done, else program would crash
            self.updateUi()
        }
    }
    
    func updateUi(){
        pokeDesc.text = pokemon.description
        type.text = pokemon.type
        defense.text = pokemon.defense
        attack.text = pokemon.attack
        weight.text = pokemon.weight
        height.text = pokemon.height
        pokedexId.text = "\(pokemon.pokedexId)"
        if pokemon.nextEvoId == ""{
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else{
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            var str = "Next Evolution: \(pokemon.nextEvoName)"
            
            if pokemon.nextEvoLevel != ""{
                str = str + " - LVL \(pokemon.nextEvoLevel)"
            }
            
            evoLbl.text = pokemon.nextEvoLevel
            
        }

        
    }
    
    @IBAction func backBtnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
