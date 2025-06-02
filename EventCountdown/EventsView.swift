//
//  EventsView.swift
//  EventCountdown
//
//  Created by Kevin James on 6/1/25.
//

import SwiftUI

struct EventsView: View {
    @State var events: [Event]
    
    var body: some View {
        NavigationStack {
            List(events) {event in
                NavigationLink(value: event) {
                    EventRowView(event: event)
                }
            }
            .navigationDestination(for: Event.self) {event in
                EventForm(editEvent: event, onSave: {updatedEvent in
                    if let index = self.events.firstIndex(where: {$0.id == updatedEvent.id}) {
                        print("index \(index): \(updatedEvent)")
                        self.events[index] = updatedEvent
                    } else {
                        print("no index found \(updatedEvent.id)")
                    }
                })
            }
        }
    }
}

#Preview {
    EventsView(events: [Event(title: "Test Event", date: Date(timeIntervalSinceNow: 60), textColor: .blue)])
}
