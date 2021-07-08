import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isEditing = false
    var search: (() -> Void)?

    var body: some View {
        HStack {
            HStack {
                Image.magnifyingGlass
                searchTextField
                clearTextButton
            }
            .padding(8)
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)

            if isEditing {
                cancelButton
            }
        }
        .navigationBarHidden(isEditing)
    }

    private var searchTextField: some View {
        TextField(String.Localizable.searchBarPlaceholder, text: $searchText) { isEditing in
            self.isEditing = isEditing
        }
        .onChange(of: searchText) { _ in
            search?()
        }
        .foregroundColor(.primary)
    }

    private var clearTextButton: some View {
        Button(action: {
            self.searchText = ""
            self.isEditing = true
        }) {
            Image.multiplyCircleFill.opacity(searchText.isEmpty ? 0 : 1)
        }
    }

    private var cancelButton: some View {
        Button(String.Localizable.cancelButton) {
            UIApplication.shared.endEditing(true)
            self.searchText = ""
            self.isEditing = false
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                SearchBar(searchText: .constant(""))
                    .environment(\.colorScheme, .light)
            }
            Group {
                SearchBar(searchText: .constant(""))
                    .environment(\.colorScheme, .dark)
            }
        }.previewLayout(.sizeThatFits)
    }
}
