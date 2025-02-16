 import SwiftUI

struct calendarScreenView: UIViewRepresentable {
    let interval: DateInterval
    @ObservedObject var eventCollection: eventCollection
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        return view
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, eventCollection: _eventCollection)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let changedEvent = eventCollection.changedEvent {
            uiView.reloadDecorations(forDateComponents: [changedEvent.dateComponents], animated: true)
            eventCollection.changedEvent = nil
        }

        if let movedEvent = eventCollection.movedEvent {
            uiView.reloadDecorations(forDateComponents: [movedEvent.dateComponents], animated: true)
            eventCollection.movedEvent = nil
        }
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        var parent: calendarScreenView
        @ObservedObject var eventCollection: eventCollection
        init(parent: calendarScreenView, eventCollection: ObservedObject<eventCollection>) {
            self.parent = parent
            self._eventCollection = eventCollection
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView,
                          decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            let foundEvents = eventCollection.events
                .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
            if foundEvents.isEmpty { return nil }

            if foundEvents.count > 1 {
                return .image(UIImage(systemName: "doc.on.doc.fill"),
                              color: .red,
                              size: .large)
            }
            let singleEvent = foundEvents.first!
            return .customView {
                let icon = UILabel()
                icon.text = singleEvent.eventType.icon
                return icon
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected = dateComponents
            guard let dateComponents else { return }
            let foundEvents = eventCollection.events
                .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
            if !foundEvents.isEmpty {
                parent.displayEvents.toggle()
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
        
    }
    
    
}
/*
 struct calendarScreenView: View {
 
 var body: some View {
     VStack(spacing: 0){
     // the main title
         HStack {
             Text("Calendar of Events")
             .font(.title)
             Spacer()
         }
         .padding()
         //.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
         .background(Color.init(red: 255, green: 100, blue: 100))
         
         // the sub-main title
         HStack {
             Text("Calendar")
             .font(.title2)
             Spacer()
         }
         .padding(.leading)
         Spacer()
         
         // the calendar table
         HStack {
             VStack(alignment: .leading, spacing: 0){
         }
             Spacer()
         }
         
         }
     }
 }
 */

