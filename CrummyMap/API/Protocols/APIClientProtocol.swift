import Combine

protocol APIClientProtocol {
    func request(text: String) -> AnyPublisher<APIResponse, APIError>
}
