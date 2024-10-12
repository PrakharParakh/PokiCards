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
          .frame(height: 250)
        
        VStack(spacing: -16) {
          Text(pokemon?.name ?? "Pika")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(pokemon?.textColor)
            .padding()
          
          Text(pokemon?.species.flavorTextEntries?.first?.flavorText?.replacingOccurrences(of: "\n", with: "") ?? "Hola Amiafadfj dfj    dfj")
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
