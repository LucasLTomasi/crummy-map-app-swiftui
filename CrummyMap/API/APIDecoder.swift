import Combine
import Foundation

enum APIDecoder {
    static func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
        let decoder = JSONDecoder()

        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                .decoding(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
