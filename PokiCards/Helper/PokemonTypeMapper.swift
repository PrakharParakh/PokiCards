//
//  PokemonTypeMapper.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 12/10/24.
//

import Foundation

enum PokemonTypeMapper: String {
  case normal
  case fighting
  case flying
  case poison
  case ground
  case rock
  case bug
  case ghost
  case steel
  case fire
  case water
  case electric
  case psychic
  case ice
  case dragon
  case dark
  case fairy
  case grass
  
  var typeImage: String {
    switch self {
    case .normal: return "ic_normal"
    case .fighting: return "ic_fighting"
    case .flying: return "ic_flying"
    case .poison: return "ic_poison"
    case .ground: return "ic_ground"
    case .rock: return "ic_rock"
    case .bug: return "ic_bug"
    case .ghost: return "ic_ghost"
    case .steel: return "ic_steel"
    case .fire: return "ic_fire"
    case .water: return "ic_water"
    case .electric: return "ic_electric"
    case .psychic: return "ic_psychic"
    case .ice: return "ic_ice"
    case .dragon: return "ic_dragon"
    case .dark: return "ic_dark"
    case .fairy: return "ic_fairy"
    case .grass: return "ic_grass"
    }
  }
  
  init?(type: String) {
    self.init(rawValue: type.lowercased())
  }
}
