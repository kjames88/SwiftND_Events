//
//  ContentView.swift
//  EventCountdown
//
//  Created by Kevin James on 6/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EventsView(events: [Event(title: "Event 1", date: Date().addingTimeInterval(60)), Event(title: "Event 2", date: Date().addingTimeInterval(120))])
    }
}

#Preview {
    ContentView()
}
