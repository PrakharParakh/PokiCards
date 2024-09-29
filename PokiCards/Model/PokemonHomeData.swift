//
//  PokemonHomeData.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/29/24.
//

import SwiftUI

struct PokemonHomeData: Identifiable {
  let id = UUID()
  let detail: PokemonDetail
  let species: PokemonSpeciesResponse
  
  var name: String? {
    return detail.name?.capitalized
  }
  
  var imageUrl: String? {
    return detail.sprites?.other?.officialArtwork?.frontDefault
  }
  
  var backgroundColor: Color? {
    if let pokemonColor = ColorMapper(name: species.color?.name ?? "yellow") {
      let color = pokemonColor.color
      return color
    } else {
      return .yellow
    }
  }
}
