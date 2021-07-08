struct Place: Decodable, Hashable {
    var formatted: String
    var geometry: Geometry
}

struct Geometry: Decodable, Hashable {
    var latitude: Double
    var longitude: Double

    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}
