import Combine
import SwiftUI

class TextFieldObserver: ObservableObject {
    @Published var text = ""
    @Published var debouncedText = ""

    private var subscriptions = Set<AnyCancellable>()

    init() {
        $text
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { value in
                self.debouncedText = value
            })
            .store(in: &subscriptions)
    }
}
