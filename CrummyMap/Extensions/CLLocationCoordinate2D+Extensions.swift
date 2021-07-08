import MapKit

extension CLLocationCoordinate2D {
    struct MapAnnotationItem: Identifiable {
        let id = UUID()
        var coordinate: CLLocationCoordinate2D
    }

    static func makeMapAnnotationItem(with geometry: Geometry) -> MapAnnotationItem {
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: geometry.latitude, longitude: geometry.longitude))
    }
}
