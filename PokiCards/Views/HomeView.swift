//
//  HomeView.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
  @StateObject private var homeViewModel = HomeViewModel()
  
  var body: some View {
    List {
      ForEach(0..<homeViewModel.pokemonList.count, id: \.self) { i in
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .foregroundColor( homeViewModel.pokemonList[i].backgroundColor)
          
          VStack {
            KFImage(URL(string: homeViewModel.pokemonList[i].imageUrl ?? ""))
              .resizable()
            
            Text(homeViewModel.pokemonList[i].name ?? "")
              .listRowSeparator(.hidden)
          }
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height / 1.5)
      }
    }
    .listStyle(.plain)
    .onAppear {
      Task {
        await homeViewModel.fetchPokemonList()
      }
    }
  }
}

#Preview {
  HomeView()
}
