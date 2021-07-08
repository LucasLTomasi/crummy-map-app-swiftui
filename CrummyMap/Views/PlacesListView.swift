import SwiftUI

struct PlacesListView: View {
    @EnvironmentObject private var viewModel: PlacesListViewModel
    @StateObject private var textFieldObserver = TextFieldObserver()

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
        SearchBar(searchText: $textFieldObserver.text) {
            viewModel.isLoading = true
        }
        .onReceive(textFieldObserver.$debouncedText, perform: { text in
            viewModel.getPlaces(text: text)
        })
        .padding(.horizontal)
    }

    @ViewBuilder
    private var placesList: some View {
        switch viewModel.getAppropriateViewOption(with: textFieldObserver.text) {
        case .idle:
            placesListPlaceholder
        case .loading:
            placesListLoading
        case .showPlaces:
            placesListWithResults
        }
    }

    private var placesListPlaceholder: some View {
        VStack {
            Spacer()
            Image.arrowtriangleUpFill
                .resizable()
                .frame(width: 20, height: 20)
            Text(String.Localizable.placesListViewPlaceholderText)
                .font(.title2)
            Spacer()
        }
        .padding(.horizontal)
    }

    private var placesListLoading: some View {
        VStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .primary))
                .scaleEffect(1.5, anchor: .center)
                .padding(.bottom, 8)
            Text(String.Localizable.placesListViewLoading)
                .font(.title2)
            Spacer()
        }
        .padding(.horizontal)
    }

    private var placesListWithResults: some View {
        List {
            ForEach(viewModel.places, id: \.self) { place in
                NavigationLink(destination: PlaceDetailView(place: place)) {
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
