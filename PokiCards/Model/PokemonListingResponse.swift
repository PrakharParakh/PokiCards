//
//  PokimonListingResponse.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import Foundation

struct PokemonListingResponse: Codable {
  let count: Int?
  var next: String?
  var previous: String?
  var results: [PokemonListingResult]?
}

struct PokemonListingResult: Codable {
  let name: String?
  let url: String?
}

struct PokemonDetail: Codable {
  let id: Int?
  let name: String?
  let baseExperience: Int?
  let height: Int?
  let weight: Int?
  let sprites: Sprites?
  let species: PokemonGenericModel?
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case baseExperience = "base_experience"
    case height
    case weight
    case sprites
    case species
  }
}

struct Sprites: Codable {
  let frontDefault: String?
  let other: DreamWorldSprites?
  
  enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
    case other
  }
}

struct DreamWorldSprites: Codable {
  let dreamWorld:  DreamWorldSpritesDetail?
  let home: DreamWorldSpritesDetail?
  let officialArtwork: DreamWorldSpritesDetail?
  
  enum CodingKeys: String, CodingKey {
    case dreamWorld = "dream_world"
    case home
    case officialArtwork = "official-artwork"
  }
}

struct DreamWorldSpritesDetail: Codable {
  let frontDefault: String?

  enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
  }
}
