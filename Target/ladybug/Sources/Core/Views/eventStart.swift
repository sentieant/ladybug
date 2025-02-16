import SwiftUI

struct eventStartScreenView: View {
    @EnvironmentObject var EventCollection: eventCollection
    var body: some View {
        TabView{
            eventsListScreenView()
                .tabItem {
                    Label("List", systemImage: "list.triangle")
                }
            eventsScreenView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                    
                }
        }
    }
}

struct StartTabView_Previews: PreviewProvider {
    static var previews: some View {
        eventStartScreenView()
            .environmentObject(eventCollection(preview: true))
    }
}
