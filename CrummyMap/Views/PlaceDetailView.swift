import SwiftUI

struct PlaceDetailView: View {
    let place: String

    var body: some View {
        Text(place)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(place: "Some Place")
    }
}
