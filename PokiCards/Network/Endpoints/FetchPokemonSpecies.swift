//
//  FetchPokemonSpecies.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/29/24.
//

import Foundation

struct FetchPokemonSpecies: Endpoint {
  let speciesURL: String
  
  var path: String {
    let urlComponents = URLComponents(string: speciesURL)
    return "/pokemon-species/" + (urlComponents?.url?.lastPathComponent ?? "")
  }
}
