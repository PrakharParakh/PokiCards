//
//  PokemonMoveDetailResponse.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 12/10/24.
//

import Foundation

struct PokemonMoveDetailResponse: Codable {
  let accuracy: Int?
  let moveType: PokemonGenericModel?
  let flavorTextEntries: [PokemonFlavorTextEntry]?
  let power: Int?
  
  enum CodingKeys: String, CodingKey {
    case accuracy
    case flavorTextEntries = "flavor_text_entries"
    case power
    case moveType = "type"
  }
}
