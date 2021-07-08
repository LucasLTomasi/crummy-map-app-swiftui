import SwiftUI

struct PlacesListView: View {
    @EnvironmentObject private var viewModel: PlacesListViewModel
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                searchBar
                Spacer()
                placesList
            }
            .navigationBarTitle(Text(String.Localizable.placesListViewTitle))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            viewModel.getPlaces(text: "Austin, Texas, USA")
        }
    }

    private var searchBar: some View {
        SearchBar(searchText: $searchText) {
            viewModel.getPlaces(text: searchText)
        }
        .padding(.horizontal)
    }

    private var placesList: some View {
        List {
            ForEach(viewModel.places, id: \.self) { place in
                NavigationLink(destination: PlaceDetailView(place: place.formatted)) {
                    Text(place.formatted)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlacesListView()
                .environmentObject(PlacesListViewModel())
                .environment(\.colorScheme, .light)

            PlacesListView()
                .environmentObject(PlacesListViewModel())
                .environment(\.colorScheme, .dark)
        }
    }
}
