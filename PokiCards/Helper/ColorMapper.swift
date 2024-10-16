//
//  ColorMapper.swift
//  PokiCards
//
//  Created by Prakhar Parakh on 9/29/24.
//

import SwiftUI

enum ColorMapper: String  {
  case black
  case blue
  case brown
  case gray
  case green
  case pink
  case purple
  case red
  case white
  case yellow
  
  var color: Color {
    switch self {
    case .black: return Color.black
    case .blue: return Color.blue
    case .brown: return Color.brown
    case .gray: return Color.gray
    case .green: return Color.green
    case .pink: return Color.pink
    case .purple: return Color.purple
    case .red: return Color.red
    case .white: return Color.white
    case .yellow: return Color.yellow
    }
  }
  
  var textColor: Color {
    switch self {
    case .black: return Color.white
    case .blue: return  Color.white
    case .brown: return  Color.white
    case .gray: return  Color.white
    case .green: return  Color.white
    case .pink: return  Color.white
    case .purple: return  Color.white
    case .red: return  Color.white
    case .white: return Color.black
    case .yellow: return Color.black
    }
  }
  
  init?(name: String) {
    self.init(rawValue: name.lowercased())
  }
}
