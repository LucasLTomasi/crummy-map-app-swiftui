import Foundation

extension String {
    enum Localizable {
        // Errors
        static let urlCreationError = NSLocalizedString("url_creation_error", comment: "")

        // Search Bar
        static let searchBarPlaceholder = NSLocalizedString("search_bar_placeholder", comment: "")
        static let cancelButton = NSLocalizedString("cancel_button", comment: "")

        // Places List View
        static let placesListViewTitle = NSLocalizedString("places_list_view_title", comment: "")
    }
}
