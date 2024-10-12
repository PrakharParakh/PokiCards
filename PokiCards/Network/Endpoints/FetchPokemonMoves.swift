//
//  FetchPokemonMoves.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 12/10/24.
//

import Foundation

struct FetchPokemonMoves: Endpoint {
  let movesURL: String
  
  var path: String {
    let urlComponents = URLComponents(string: movesURL)
    return "/move/" + (urlComponents?.url?.lastPathComponent ?? "")
  }
}
