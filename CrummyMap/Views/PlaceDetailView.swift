import MapKit
import SwiftUI

struct PlaceDetailView: View {
    let place: Place

    var body: some View {
        VStack {
            Text(place.formatted)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
            Map(coordinateRegion: .constant(MKCoordinateRegion.makeRegion(with: place.geometry)),
                showsUserLocation: true,
                annotationItems: [CLLocationCoordinate2D.makeMapAnnotationItem(with: place.geometry)]) { item in
                MapPin(coordinate: item.coordinate)
            }
            .navigationBarTitle(String.Localizable.placeDetailViewTitle, displayMode: .inline)
        }
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceDetailView(place: Place(formatted: "Austin, Texas, USA", geometry: Geometry(latitude: 30.2711286, longitude: -97.7436995)))
                .environment(\.colorScheme, .light)
            PlaceDetailView(place: Place(formatted: "Austin, Texas, USA", geometry: Geometry(latitude: 30.2711286, longitude: -97.7436995)))
                .environment(\.colorScheme, .dark)
        }
    }
}
