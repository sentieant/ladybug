import SwiftUI

struct launchScreenView: View {
   
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
                    NavigationLink(destination: homeScreenView()){
                            Text("Let's be organsied!")
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
