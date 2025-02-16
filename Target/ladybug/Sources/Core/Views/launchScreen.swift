import SwiftUI

struct launchScreenView: View {
    @EnvironmentObject var EventCollection: eventCollection
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: eventType?
    @State private var isBlinking: Bool = false
    var body: some View {
            NavigationView {
                VStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .shadow(radius: 15)
                    Text("LADYBUG")
                        .shadow(radius: 15)
                        .padding()
                        .font(.custom("Lobster-Regular", size: 30))
                    // NavigationLink(destination: calendarScreenView(dataSource: CalendarManager(), delegate: CalendarHandler()))
                    NavigationLink(destination: eventStartScreenView()){
                            Text("Let's be organised!")
                        }
                    .opacity(isBlinking ? 0.1 : 1.2)
                    .animation(
                        Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true),
                               value: isBlinking
                    )
                    .onAppear(){
                        isBlinking.toggle()
                    }
                        .padding()
                        .background(Color.clear)
                        .foregroundColor(.black)
                        .font(.custom("TimesNewRomanPSMT", size: 25))
                }
            }
    }
   
//    init() {
//        for familyName in UIFont.familyNames {
//            print(familyName)
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print("--- \(fontName)")
//            }
//        }
//    }
     
}
