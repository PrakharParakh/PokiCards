struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView() // Home Tab
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            BookmarksView() // Bookmarks Tab
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark.fill")
                }

            ProfileView() // Profile Tab
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}