//
//  PokemonCardView.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 12/10/24.
//

import SwiftUI
import Kingfisher

struct PokemonCardView: View {
  var pokemon: PokemonHomeData?

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12)
        .stroke(pokemon?.textColor ?? .black, lineWidth: 5)
        .fill(pokemon?.backgroundColor.gradient ?? Color.white.gradient)

      VStack(spacing: 24) {
        HStack {
          Spacer()
          HStack {
            HStack(alignment: .bottom, spacing: 4)  {
              Text("EXP")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(pokemon?.textColor)
              Text("\(pokemon?.detail.baseExperience ?? 0)")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(pokemon?.textColor)
            }
            Image(pokemon?.typeImage ?? "ic_fire")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 24)
          }
        }
        .padding([.top, .horizontal])

        Spacer()

        KFImage(URL(string: pokemon?.imageUrl ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png"))
          .resizable()
          .scaledToFit()
          .frame(maxHeight: 250)
        
        VStack(alignment: .leading) {
          HStack {
            Image(pokemon?.moveTypeImage ?? "ic_fire")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 24)
            Spacer()
            Text(pokemon?.detail.moves?.first?.move?.name ?? "")
              .font(.title3)
              .fontWeight(.semibold)
              .foregroundColor(pokemon?.textColor)
            Spacer()
            Text("\(pokemon?.moves.power ?? 0)")
              .font(.title3)
              .fontWeight(.semibold)
              .foregroundColor(pokemon?.textColor)
          }
          Text(pokemon?.moves.flavorTextEntries?.first?.flavorText?.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\u{0C}", with: " ") ?? "")
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(pokemon?.textColor)
        }
        .padding(.horizontal)
        
        VStack(spacing: -16) {
          Text(pokemon?.name ?? "")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(pokemon?.textColor)
            .padding()
          
          Text(pokemon?.species.flavorTextEntries?.first?.flavorText?.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\u{0C}", with: " ") ?? "")
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(pokemon?.textColor)
            .padding()
        }
      }
    }
  }
}

#Preview {
    PokemonCardView()
}
