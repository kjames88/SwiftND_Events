//
//  EventsView.swift
//  EventCountdown
//
//  Created by Kevin James on 6/1/25.
//

import SwiftUI

struct EventsView: View {
    @State var events: [Event]
    
    private func deleteEvent(offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(events.sorted()) { event in
                    NavigationLink(value: event) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: deleteEvent)
            }
            .buttonStyle(.borderedProminent)
            .navigationDestination(for: Event.self) { event in
                EventForm(editEvent: event, onSave: { updatedEvent in
                    if let index = self.events.firstIndex(where: {$0.id == updatedEvent.id}) {
                        print("index \(index): \(updatedEvent)")
                        self.events[index] = updatedEvent
                    } else {
                        print("no index found \(updatedEvent.id)")
                    }
                })
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination:
                        EventForm(editEvent: nil, onSave: { newEvent in
                            events.append(newEvent)
                    })) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
            }
        }
    }
}

#Preview {
    EventsView(events: [Event(title: "Test Event", date: Date(timeIntervalSinceNow: 60), textColor: .blue)])
}
