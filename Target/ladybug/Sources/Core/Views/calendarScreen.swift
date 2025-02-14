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

protocol CalendarDataSource {
    func getCalendarData() -> [(day: String, date: String, event: String)]
}

protocol CalendarDelegate {
    func didSelectDate(date: String)
}

class CalendarManager: CalendarDataSource {
    
    func getCalendarData() -> [(day: String, date: String, event: String)] {
        return [
            ("Monday", "12", "Meeting"),
            ("Tuesday", "13", "Workout"),
            ("Wednesday", "14", "Project Deadline"),
            ("Thursday", "15", "Dinner with Friends"),
            ("Friday", "16", "Flight to NYC")
        ]
    }
}

struct calendarScreenView: View {
    
    let dataSource: CalendarDataSource
    let delegate: CalendarDelegate?
    
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
                
                // 🟡 Month Header
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
                
                ForEach(dataSource.getCalendarData(), id: \.date) { item in
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
                    .onTapGesture {
                        delegate?.didSelectDate(date: item.date) // Delegate Action
                    }
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

class CalendarHandler: CalendarDelegate {
    func didSelectDate(date: String) {
        print("User selected date: \(date)")
    }
}

struct CalendarScreenView_Previews: PreviewProvider {
    static var previews: some View {
        calendarScreenView(dataSource: CalendarManager(), delegate: CalendarHandler())
    }
}
