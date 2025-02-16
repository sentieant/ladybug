import SwiftUI

struct eventFormView: View {
    @EnvironmentObject var EventCollection: eventCollection
    @StateObject var viewModel: eventFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    DatePicker("Date and Time", selection: $viewModel.date)

                    TextField("Description", text: $viewModel.desc, axis: .vertical)
                        .focused($focus, equals: true)

                    Picker("Event Type", selection: $viewModel.eventType) {
                        ForEach(Event.eventType.allCases, id: \.self) { eventType in
                            Text("\(eventType.icon) \(eventType.rawValue.capitalized)")
                                .tag(eventType)
                        }
                    }

                    Section(footer: HStack {
                        Spacer()
                        Button {
                            saveEvent()
                        } label: {
                            Text(viewModel.updating ? "Update Event" : "Add Event")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.incomplete)
                        Spacer()
                    }) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle(viewModel.updating ? "Update" : "New Event")
            .onAppear { focus = true }
        }
    }

    private func saveEvent() {
        if viewModel.updating, let eventId = viewModel.id {
            let event = Event(id: eventId, eventType: viewModel.eventType, date: viewModel.date, desc: viewModel.desc)
            EventCollection.update(event)
        } else {
            let newEvent = Event(eventType: viewModel.eventType, date: viewModel.date, desc: viewModel.desc)
            EventCollection.add(newEvent)
        }
        dismiss()
    }
}

struct EventFormView_Previews: PreviewProvider {
    static var previews: some View {
        eventFormView(viewModel: eventFormViewModel())
            .environmentObject(eventCollection()) // Ensuring eventCollection instance
    }
}
