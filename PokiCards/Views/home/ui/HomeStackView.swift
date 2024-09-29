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
            // Iterate over the Pokémon list in reverse order for stack effect
            ForEach((0..<homeViewModel.pokemonList.count).reversed(), id: \.self) { i in
                if i >= topCardIndex {
                    let pokemon = homeViewModel.pokemonList[i]
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(pokemon.backgroundColor)
                        
                        VStack {
                            KFImage(URL(string: pokemon.imageUrl ?? ""))
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                            
                            Text(pokemon.name ?? "")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height / 1.5)
                    .offset(i == topCardIndex ? offset : .zero)
                    .rotationEffect(i == topCardIndex ? .degrees(Double(offset.width / 20)) : .zero) // Smooth tilt
                    .scaleEffect(i == topCardIndex ? 1 : 0.95) // Cards behind scale down
                    .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: offset)
                    .gesture(
                        DragGesture()
                            .updating($isDragging) { value, state, _ in
                                state = true // Track the drag state
                            }
                            .onChanged { gesture in
                                // Only drag the top card
                                if i == topCardIndex {
                                    offset = gesture.translation
                                }
                            }
                            .onEnded { gesture in
                                // If swipe exceeds threshold, remove the card
                                if abs(gesture.translation.width) > 150 {
                                    withAnimation {
                                        offset = CGSize(width: gesture.translation.width > 0 ? 1000 : -1000, height: 0)
                                    }
                                    // Move to the next card after the animation
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation {
                                            topCardIndex += 1
                                            offset = .zero // Reset offset for the next card
                                        }
                                    }
                                } else {
                                    // Bounce back if swipe wasn't enough
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
