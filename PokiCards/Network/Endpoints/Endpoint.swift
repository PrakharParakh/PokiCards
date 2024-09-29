//
//  Endpoint.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/28/24.
//

import Foundation

protocol Endpoint {
  var path: String { get }
  var method: HTTPMethod { get }
  var queryItems: [URLQueryItem]? { get }
  var body: Data? { get }
}

extension Endpoint {
  var method: HTTPMethod { return .GET }
  var queryItems: [URLQueryItem]? { return nil }
  var body: Data? { return nil }
}
