import SwiftUI

struct PlacesListView: View {
    @EnvironmentObject private var viewModel: PlacesListViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("Search Bar")
                Spacer()
                placesList
                Spacer()
            }
        }
        .onAppear {
            viewModel.getPlaces(text: "Austin, Texas, USA")
        }
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
        PlacesListView()
    }
}
