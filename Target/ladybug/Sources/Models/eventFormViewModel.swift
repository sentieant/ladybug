import Foundation

class eventFormViewModel: ObservableObject {
    @Published var date = Date()
    @Published var desc = ""
    @Published var eventType: Event.eventType = .unspecified

    var id: String?
    var updating: Bool { id != nil }

    init() {}

    init(_ event: Event) {
        date = event.date
        desc = event.desc
        eventType = event.eventType
        id = event.id
    }

    var incomplete: Bool {
        desc.isEmpty
    }
}
