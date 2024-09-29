//
//  MainTabView.swift
//  PokiCards
//
//  Created by Pradip Awasthi on 29/09/24.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView {
            HomeStackView() // Home Tab
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            BookmarksView() // Bookmarks Tab
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark.fill")
                }

          SettingsView() // Settings Tab
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}
