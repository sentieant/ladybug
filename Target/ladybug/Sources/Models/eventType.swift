import SwiftUI

enum eventType: Identifiable, View {
    case new
    case update(Event)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }

    var body: some View {
        switch self {
        case .new:
            return eventFormView(viewModel: eventFormViewModel())
        case .update(let event):
            return eventFormView(viewModel: eventFormViewModel(event))
        }
    }
}
