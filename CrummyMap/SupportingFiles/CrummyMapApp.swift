import SwiftUI

@main
struct CrummyMapApp: App {
    private let viewModel = PlacesListViewModel()

    var body: some Scene {
        WindowGroup {
            PlacesListView()
                .environmentObject(viewModel)
        }
    }
}
