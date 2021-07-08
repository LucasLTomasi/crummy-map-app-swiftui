import Combine
import SwiftUI

class PlacesListViewModel: ObservableObject {
    private let apiClient = APIClient.shared
    private var disposables = Set<AnyCancellable>()
    @Published private(set) var places: [Place] = []

    func getPlaces(text: String) {
        apiClient.request(text: text)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    if case .failure = value {
                        self?.places = []
                    }
                },
                receiveValue: { [weak self] apiResponse in
                    self?.places = apiResponse.results
            })
            .store(in: &disposables)
    }
}
