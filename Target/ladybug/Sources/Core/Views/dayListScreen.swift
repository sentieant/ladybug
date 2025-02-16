import SwiftUI

struct dayListScreenView: View {
    @EnvironmentObject var EventCollection: eventCollection
    @Binding var dateSelected: DateComponents?
    @State private var formType: eventType?
    var filteredEvents: [Event] {
        guard let date = dateSelected?.date else { return [] }
        return EventCollection.events.filter { $0.date.startOfDay == date.startOfDay }
    }

    var body: some View {
        NavigationStack {
            Group {
                if !filteredEvents.isEmpty {
                    List {
                        ForEach(filteredEvents) { event in
                            ListViewRow(event: event, formType: $formType)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        EventCollection.delete(event) // Fixed reference
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                                .sheet(item: $formType) { $0 }
                        }
                    }
                } else {
                    Text("No events for this date")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding()
                }
            }
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "No Date Selected")
        }
    }
}

// MARK: - Preview
struct dayListScreenView_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month, .day, .year, .hour, .minute],
            from: Date()
        )
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    static var previews: some View {
        dayListScreenView(dateSelected: .constant(dateComponents))
            .environmentObject(eventCollection(preview: true)) // Fixed syntax
    }
}
