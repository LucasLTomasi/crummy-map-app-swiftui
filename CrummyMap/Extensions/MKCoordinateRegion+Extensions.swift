import MapKit

extension MKCoordinateRegion {
    static func makeRegion(with geometry: Geometry) -> Self {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: geometry.latitude, longitude: geometry.longitude),
                           span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
}
