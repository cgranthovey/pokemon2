//
//  PokeCell.swift
//  pokemonTwo
//
//  Created by Chris Hovey on 6/2/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalizedString
        img.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
