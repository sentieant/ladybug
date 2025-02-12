import SwiftUI

struct launchScreenView: View {
    var body: some View {
        Image("Image")
            .resizable()
            .frame(width: 200, height: 200)
            .shadow(radius: 15)
        Text("LADYBUG")
            .padding()
            .font(.custom("Lobster-Regular", size: 30))
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
