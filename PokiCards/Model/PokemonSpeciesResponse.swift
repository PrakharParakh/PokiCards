//
//  PokemonSpeciesResponse.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/29/24.
//

import Foundation

struct PokemonSpeciesResponse: Codable {
  let baseHappiness: Int?
  let captureRate: Int?
  let color: PokemonGenericModel?
  let flavorTextEntries: [PokemonFlavorTextEntry]?
  
  enum CodingKeys: String, CodingKey {
    case baseHappiness = "base_happiness"
    case captureRate = "capture_rate"
    case color
    case flavorTextEntries = "flavor_text_entries"
  }
}

struct PokemonFlavorTextEntry: Codable {
  let flavorText: String?
  let language: PokemonGenericModel?
  let version: PokemonGenericModel?
  
  enum CodingKeys: String, CodingKey {
    case flavorText = "flavor_text"
    case language
    case version
  }
}
