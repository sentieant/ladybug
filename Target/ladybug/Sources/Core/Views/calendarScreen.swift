/*
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
 HStack {
 VStack(alignment: .leading, spacing: 0){
 List{
 
 }
 }
 Spacer()
 }
 
 }
 }
 }
 */

import SwiftUI

struct calendarScreenView: View {
    
    let calendarData: [(day: String, date: String, event: String)] = [
        ("Monday", "12", "Meeting"),
        ("Tuesday", "13", "Workout"),
        ("Wednesday", "14", "Project Deadline"),
        ("Thursday", "15", "Dinner with Friends"),
        ("Friday", "16", "Flight to NYC")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Text("Calendar of XYZ")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding()
            
            HStack {
                Text("Calendar")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.leading)
            
            VStack(spacing: 0) {
                
                Text("Month")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .border(Color.black, width: 1)
                
                HStack(spacing: 0) {
                    Text("Day")
                        .frame(width: 80)
                        .bold()
                    Divider()
                    Text("Date")
                        .frame(width: 80)
                        .bold()
                    Divider()
                    Text("Events/Tasks")
                        .frame(maxWidth: .infinity)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .border(Color.black, width: 1)
                
                ForEach(calendarData, id: \.date) { item in
                    HStack(spacing: 0) {
                        Text(item.day)
                            .frame(width: 80)
                        Divider()
                        Text(item.date)
                            .frame(width: 80)
                        Divider()
                        Text(item.event)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .border(Color.black, width: 1)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct CalendarScreenView_Previews: PreviewProvider {
    static var previews: some View {
        calendarScreenView()
    }
}

