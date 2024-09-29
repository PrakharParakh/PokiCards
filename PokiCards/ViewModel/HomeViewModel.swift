//
//  HomeViewModel.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
  @Published var pokemonList: [PokemonHomeData] = []
  @Published var isLoading = false
  @Published var errorMessage: String?
  
  private let apiClient: APIClient
  
  init(apiClient: APIClient = NetworkManager()) {
    self.apiClient = apiClient
  }
  
  func fetchPokemonList() async {
    isLoading = true
    defer { isLoading = false }
    
    do {
      let listEndpoint = FetchPokimonListing()
      let listResponse: PokemonListingResponse = try await apiClient.request(endpoint: listEndpoint)
      
      let pokemonDetails = try await withThrowingTaskGroup(of: PokemonHomeData?.self) { group in
        if let results = listResponse.results {
          for pokemonInfo in results {
            group.addTask {
              return await self.fetchPokemonData(pokemonInfo: pokemonInfo)
            }
          }
        }
        
        var allPokemonDetails: [PokemonHomeData] = []
        for try await result in group {
          if let pokemonData = result {
            allPokemonDetails.append(pokemonData)
          }
        }
        return allPokemonDetails
      }
      
      self.pokemonList = pokemonDetails
    } catch {
      errorMessage = "Failed to load Pokémon: \(error)"
    }
  }
  
  private func fetchPokemonData(pokemonInfo: PokemonListingResult) async -> PokemonHomeData? {
    do {
      let detailEndpoint = FetchPokimonDetail(pokemonURL: pokemonInfo.url ?? "")
      let pokemonDetail: PokemonDetail = try await apiClient.request(endpoint: detailEndpoint)
      
      let speciesEndpoint = FetchPokemonSpecies(speciesURL: pokemonDetail.species?.url ?? "")
      let pokemonSpecies: PokemonSpeciesResponse = try await apiClient.request(endpoint: speciesEndpoint)
      
      return PokemonHomeData(detail: pokemonDetail, species: pokemonSpecies)
    } catch {
      print("Failed to load data for Pokémon: \(pokemonInfo.name) - \(error)")
      return nil
    }
  }
}
