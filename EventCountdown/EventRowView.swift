//
//  EventRowView.swift
//  EventCountdown
//
//  Created by Kevin James on 6/1/25.
//

import SwiftUI

struct EventRowView: View {
    var event: Event
    @State private var relativeTime: String
    
    let formatter = RelativeDateTimeFormatter()
    
    init(event: Event) {
        self.event = event
        self.relativeTime = formatter.localizedString(for: event.date, relativeTo: Date())
    }
    
    // Real time relative time field update
    // https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-a-timer-with-swiftui
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        VStack {
            Text("\(event.title)")
                .foregroundStyle(event.textColor)
                .font(.title)
            //Text("\(formatter.localizedString(for: event.date, relativeTo: Date()))")
            Text("\(relativeTime)")
                .onReceive(timer) { _ in
                    relativeTime = formatter.localizedString(for: event.date, relativeTo: Date())
                }
        }
    }
}

#Preview {
    EventRowView(event: Event (title: "Test Event", date: Date(timeIntervalSinceNow: 120), textColor: .orange))
}
