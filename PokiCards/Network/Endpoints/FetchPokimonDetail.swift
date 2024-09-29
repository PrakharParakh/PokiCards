//
//  FetchPokimonDetail.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import Foundation

struct FetchPokimonDetail: Endpoint {
  let pokemonURL: String
  
  var path: String {
    let urlComponents = URLComponents(string: pokemonURL)
    return "/pokemon/" + (urlComponents?.url?.lastPathComponent ?? "")
  }
}
