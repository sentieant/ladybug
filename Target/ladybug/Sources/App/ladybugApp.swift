import SwiftUI

@main
struct ladybugApp: App {
    @StateObject private var EventCollection = eventCollection()
    
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                launchScreenView()
                    .environmentObject(EventCollection)
            }
    }
    }
}

//#Preview{
//    calendarScreenView(interval: DateInterval(start: .distantPast, end: .distantFuture),
//                                                   eventCollection: eventCollection,
//                                                   dateSelected: $dateSelected,
//                                                   displayEvents: $displayEvents))
//}






