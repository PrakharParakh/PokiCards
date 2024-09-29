struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()

    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .padding()
            
            Text(profileViewModel.userName)
                .font(.title)
                .padding()
            
            // Add other profile-related views
        }
    }
}