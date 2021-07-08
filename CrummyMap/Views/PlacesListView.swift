import SwiftUI

struct PlacesListView: View {
    private var places = ["Some Place", "Another Place"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Search Bar")
                Spacer()
                List {
                    ForEach(places, id: \.self) { place in
                        NavigationLink(destination: PlaceDetailView(place: place)) {
                            Text(place)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView()
    }
}
