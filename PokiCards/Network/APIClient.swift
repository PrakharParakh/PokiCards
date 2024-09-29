//
//  APIClient.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import Foundation

protocol APIClient {
  func request<T: Decodable>(endpoint: Endpoint) async throws -> T  
}
