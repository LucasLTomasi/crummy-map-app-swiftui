import SwiftUI

struct PlacesListView: View {
    @EnvironmentObject private var viewModel: PlacesListViewModel
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                searchBar
                placesList
            }
            .navigationBarTitle(Text(String.Localizable.placesListViewTitle))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private var searchBar: some View {
        SearchBar(searchText: $searchText) {
            viewModel.getPlaces(text: searchText)
        }
        .padding(.horizontal)
    }

    @ViewBuilder
    private var placesList: some View {
        switch viewModel.getAppropriateViewOption(with: searchText) {
        case .idle:
            placesListPlaceholder
        case .showPlaces:
            placesListWithResults
        }
    }

    private var placesListPlaceholder: some View {
        VStack {
            Spacer()
            Image.arrowtriangleUpFill
                .resizable()
                .frame(width: 30, height: 30)
            Text(String.Localizable.placesListViewPlaceholderText)
                .font(.title2)
            Spacer()
        }
        .padding(.horizontal)
    }

    private var placesListWithResults: some View {
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
