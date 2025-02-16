import SwiftUI

struct eventsScreenView: View {
    @EnvironmentObject var eventStore: eventCollection
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: eventType?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                calendarScreenView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                   eventCollection: eventStore,
                             dateSelected: $dateSelected,
                             displayEvents: $displayEvents)
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }
            .sheet(item: $formType) { $0 }
            .sheet(isPresented: $displayEvents) {
                dayListScreenView(dateSelected: $dateSelected)
                    .presentationDetents([.medium, .large])
            }
            
                .navigationTitle("Calendar of Events")
        }
    }
}

struct eventsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        eventsScreenView()
            .environmentObject(eventCollection(preview: true))
    }
}
