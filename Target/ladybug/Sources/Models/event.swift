import Foundation

struct Event: Identifiable {
    enum eventType: String, Identifiable, CaseIterable {
        case work, home, social, sport, unspecified
        var id: String { self.rawValue }
        var icon: String {
                    switch self {
                    case .work:
                        return "🏦"
                    case .home:
                        return "🏡"
                    case .social:
                        return "🎉"
                    case .sport:
                        return "🏟"
                    case .unspecified:
                        return "📌"
                    }
                }
    }
    
    var eventType: eventType
    var date: Date
    var desc: String
    var id: String
    
    var dateComponents: DateComponents {
           var dateComponents = Calendar.current.dateComponents(
               [.month,
                .day,
                .year,
                .hour,
                .minute],
               from: date)
           dateComponents.timeZone = TimeZone.current
           dateComponents.calendar = Calendar(identifier: .gregorian)
           return dateComponents
       }

    
    init(id: String = UUID().uuidString, eventType: eventType = .unspecified, date: Date, desc: String){
        self.eventType = eventType
        self.date = date
        self.desc = desc
        self.id = id
    }
    
    static var exampleEvents: [Event] {
        return [
            Event(eventType: .home, date: Date().diff(numDays: 0), desc: "ABC"),
            Event(eventType: .work, date: Date().diff(numDays: 6), desc: "XYZ")
        ]
    }
}
