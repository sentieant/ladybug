import SwiftUI

struct eventsListScreenView: View {
    @EnvironmentObject var myEvents: eventCollection
    @State private var formType: eventType?
    var body: some View {
        NavigationStack {
            List {
                ForEach(myEvents.events.sorted {$0.date < $1.date }) { event in
                    ListViewRow(event: event, formType: $formType)
                    .swipeActions {
                        Button(role: .destructive) {
                            myEvents.delete(event)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .navigationTitle("List of Events")
            .sheet(item: $formType) { $0 }
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
        }
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        eventsListScreenView()
            .environmentObject(eventCollection(preview: true))
    }
}
