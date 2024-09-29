struct BookmarksView: View {
    @StateObject var bookmarksViewModel = BookmarksViewModel()

    var body: some View {
        NavigationView {
            List(bookmarksViewModel.bookmarkedPokemons) { pokemon in
                Text(pokemon.name ?? "Unknown")
            }
            .navigationTitle("Bookmarks")
        }
        .onAppear {
            bookmarksViewModel.fetchBookmarks()
        }
    }
}