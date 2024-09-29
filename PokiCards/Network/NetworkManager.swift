//
//  NetworkManager.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import Foundation

class NetworkManager: APIClient {
  private let baseURL = "https://pokeapi.co/api/v2"
  
  func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
    print(baseURL + endpoint.path)
    guard var urlComponents = URLComponents(string: baseURL + endpoint.path) else {
      throw NetworkError.invalidURL
    }
    
    urlComponents.queryItems = endpoint.queryItems
    
    guard let url = urlComponents.url else {
      throw NetworkError.invalidURL
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue
    request.httpBody = endpoint.body
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      
      guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.badResponse((response as? HTTPURLResponse)?.statusCode ?? 500)
      }
      
      return try JSONDecoder().decode(T.self, from: data)
    } catch {
      throw NetworkError.requestFailed(error)
    }
  }
}
