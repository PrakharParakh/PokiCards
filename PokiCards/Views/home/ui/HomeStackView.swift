//
//  TinderStackView.swift
//  PokiCards
//
//  Created by Pradip Awasthi on 29/09/24.
//

import SwiftUI
import Kingfisher

struct HomeStackView: View {
  @StateObject private var homeViewModel = HomeViewModel()
  
  
  @State private var offset: CGSize = .zero
  @State private var topCardIndex: Int = 0
  @GestureState private var isDragging = false
  
  var body: some View {
    ZStack {
      ForEach((0..<homeViewModel.pokemonList.count).reversed(), id: \.self) { i in
        if i >= topCardIndex {
          let pokemon = homeViewModel.pokemonList[i]
          
          PokemonCardView(pokemon: pokemon)
            .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height / 1.5)
            .offset(i == topCardIndex ? offset : .zero)
            .rotationEffect(i == topCardIndex ? .degrees(Double(offset.width / 20)) : .zero)
            .scaleEffect(i == topCardIndex ? 1 : 0.95)
            .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: offset)
            .gesture(
              DragGesture()
                .updating($isDragging) { value, state, _ in
                  state = true
                }
                .onChanged { gesture in
                  if i == topCardIndex {
                    offset = gesture.translation
                  }
                }
                .onEnded { gesture in
                  if abs(gesture.translation.width) > 150 {
                    withAnimation {
                      offset = CGSize(width: gesture.translation.width > 0 ? 1000 : -1000, height: 0)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                      withAnimation {
                        topCardIndex += 1
                        offset = .zero
                      }
                    }
                  } else {
                    withAnimation(.spring()) {
                      offset = .zero
                    }
                  }
                }
            )
        }
      }
    }
    .onAppear {
      Task {
        await homeViewModel.fetchPokemonList()
      }
    }
  }
}

#Preview {
  HomeStackView()
}
