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
  
  var backgroundColor: Color {
    if let pokemonColor = ColorMapper(name: species.color?.name ?? "white") {
      let color = pokemonColor.color
      return color
    } else {
      return .white
    }
  }
  
  var textColor: Color {
    if let pokemonColor = ColorMapper(name: species.color?.name ?? "black") {
      let color = pokemonColor.textColor
      return color
    } else {
      return .black
    }
  }
  
  var typeImage: String {
    if let type = PokemonTypeMapper(type: detail.types?.first?.type?.name ?? "normal") {
      let image = type.typeImage
      return image
    } else {
      return "ic_normal"
    }
  }
}
