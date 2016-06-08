//
//  Pokemon.swift
//  pokemonTwo
//
//  Created by Chris Hovey on 6/2/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon{
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoId: String!
    private var _nextEvoName: String!
    private var _nextEvoLevel: String!
    private var _pokemonUrl: String!
    
    var name: String{
        return _name
    }
    
    var pokedexId: Int{
        return _pokedexId
    }
    
    var description: String{        //since we are not returning an optional we need to make sure our code can handle it.
        if _description == nil{
            _description = ""
        }
        return _description
    }
    
    var type: String{
        if _type == nil{
            _type = ""
        }
        return _type
    }
    
    var defense: String{
        if _defense == nil{
            _defense = ""
        }
        return _defense
    }
    
    var attack: String{
        if _attack == nil{
            _attack = ""
        }
        return _attack
    }
    
    var height: String{
        if _height == nil{
            _height = ""
        }
        return _height
    }
    var weight: String{
        if _weight == nil{
            _weight = ""
        }
        return _weight
    }
    
    var nextEvoId: String{
        if _nextEvoId == nil{
            _nextEvoId = ""
        }
        return _nextEvoId
    }
    
    var nextEvoName: String{
        if _nextEvoName == nil{
            _nextEvoName = ""
        }
        return _nextEvoName
    }
    
    var nextEvoLevel: String{
        if _nextEvoLevel == nil{
            _nextEvoLevel = ""
        }
        return _nextEvoLevel
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = urlBase + urlPokemon + "\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete){       //here we are passing in the closure that is going to be called, so we need to make sure we call it
        
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }

                if let height = dict["height"] as? String{
                    self._height = height
                }

                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0{
                    if let name = types[0]["name"]{         // types[0] calls the first dictionary in the array, and ["name"] is a key value in that dictionary
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1{
                        var x = 1
                        while x < types.count{
                            if let name = types[x]["name"]{
                                self._type! += "/\(name.capitalizedString)"
                            }
                        x = x+1
                        }
                    }
                } else{
                    self._type = ""
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String, String>] where descriptions.count > 0{
                    if let resourceUri = descriptions[0]["resource_uri"]{
                        let descUrl = urlBase + resourceUri
                        let url1 = NSURL(string: descUrl)!

                        Alamofire.request(.GET, url1).responseJSON{ response in
                            let desResult = response.result
                            
                            if let JSON = desResult.value as? Dictionary<String, AnyObject>{
                                if let pokemonDescription = JSON["description"] as? String{
                                    self._description = pokemonDescription
                                    print(self._description)    //if I called this print down below where the others are listed the system would not yet have a value when they try to print it
                                }
                            }
                            completed()
                        }
                    }
                } else{
                    self._description = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0{
                    if let to = evolutions[0]["to"] as? String{
                        if to.rangeOfString("mega") == nil{     //if there is not the word mega in the string then execute this
                            if let uri = evolutions[0]["resource_uri"] as? String{
                                let newString = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                let num = newString.stringByReplacingOccurrencesOfString("/", withString: "")

                                self._nextEvoId = num
                                self._nextEvoName = to
                                
                                if let evoLevelUp = evolutions[0]["level"] as? Int{
                                    self._nextEvoLevel = "\(evoLevelUp)"
                                }
                                print(self._nextEvoLevel)
                                print(self._nextEvoName)
                                print(self._nextEvoId)
                            }
                        }
                    }
                }
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                print(self._type)
            }
        }
    }
}















