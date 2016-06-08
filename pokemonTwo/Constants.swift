//
//  Constants.swift
//  pokemonTwo
//
//  Created by Chris Hovey on 6/3/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation

let urlBase = "http://pokeapi.co"
let urlPokemon = "/api/v1/pokemon/"

typealias DownloadComplete = () -> () // creating a closure, block of code which is called when we want it to, like when a download is complete.  I use in Pokemon.swift.  Whole point of closure is code that can be called at a later time

