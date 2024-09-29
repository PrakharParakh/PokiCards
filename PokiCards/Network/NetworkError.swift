//
//  NetworkError.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case requestFailed(Error)
  case decodingFailed(Error)
  case badResponse(Int)  
}
