//
//  Event.swift
//  EventCountdown
//
//  Created by Kevin James on 6/1/25.
//

import Foundation
import SwiftUICore

struct Event: Identifiable, Comparable, Hashable {
    static func < (lhs: Event, rhs: Event) -> Bool {
        if (lhs.date == rhs.date) {
            return lhs.title < rhs.title
        }
        return lhs.date < rhs.date
    }
    
    init(title: String, date: Date, textColor: Color = .primary) {
        self.id = UUID()
        self.title = title
        self.date = date
        self.textColor = textColor
    }
    
    var id: UUID
    var title: String
    var date: Date
    var textColor: Color
}
