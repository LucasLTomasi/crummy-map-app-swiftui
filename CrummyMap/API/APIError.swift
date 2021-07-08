enum APIError: Error {
    case decoding(description: String)
    case network(description: String)
}
