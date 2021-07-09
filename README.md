# Crummy Map App - SwiftUI
Alamo Drafthouse iOS Coding Challenge

## Project Structure:
- <ins>__CrummyApp__</ins>: app root
  - <ins>__API__</ins>: *handles all API logic*
    - <ins>APIClient</ins>: *makes HTTP requests*
    - <ins>APIDecoder</ins>: *decodes APIResponses*
    - <ins>APIError</ins>: *used to return different errors*
    - <ins>APIResponse</ins>: *response for the only route used*
    - <ins>__Protocols__</ins>
      - <ins>APIClientProtocol</ins>: *also used for unit testing*
  - <ins>__Extensions__</ins>
    - <ins>CLLocationCoordinate2D+Extensions</ins>: *used to make map annotation item based on Geometry*
    - <ins>Image+Extensions</ins>: *centralized image resource access*
    - <ins>MKCoordinateRegion+Extensions</ins>: *used to make region based on Geometry*
    - <ins>String+Extensions</ins>: *centralized string resource access*
    - <ins>UIApplication+Extensions</ins>: *used by the search bar to force end editing*
  - <ins>__Helpers__</ins>
    - <ins>TextFieldObserver</ins>: *used for search text debouncing*
  - <ins>__Models__</ins>
    - <ins>Place</ins>: *represents the place that was searched*
  - <ins>__SupportingFiles__</ins>
    - <ins>Localizable.strings</ins>: *stores strings that could be localized*
    - <ins>CrummyMapApp</ins>: *main entry point that passes the view model as an environment object*
  - <ins>__ViewModels__</ins>
    - <ins>PlacesListViewModel</ins>: *uses combine to communicate with the api client and reflect changes on the view*
  - <ins>__Views__</ins>
    - <ins>PlaceDetailView</ins>: *holds the detail view*
    - <ins>PlacesListView</ins>: *holds the places list view*

