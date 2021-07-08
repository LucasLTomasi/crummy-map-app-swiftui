import Combine
import SwiftUI

class PlacesListViewModel: ObservableObject {
    enum PlaceListViewOption {
        case idle
        case loading
        case showPlaces
    }

    private let apiClient = APIClient.shared
    private var disposables = Set<AnyCancellable>()
    @Published private(set) var places: [Place] = []
    @Published var isLoading: Bool = false

    func getAppropriateViewOption(with searchText: String) -> PlaceListViewOption {
        if searchText.isEmpty {
            return .idle
        } else if isLoading {
            return .loading
        } else {
            return .showPlaces
        }
    }

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
                    self?.isLoading = false
            })
            .store(in: &disposables)
    }
}
