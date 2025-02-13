import SwiftUI

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
            
            
        }
    }
}
