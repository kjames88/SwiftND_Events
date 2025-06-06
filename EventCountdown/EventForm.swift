//
//  EventForm.swift
//  EventCountdown
//
//  Created by Kevin James on 6/1/25.
//

import SwiftUI

struct EventForm: View {
    enum Function {
        case addNew
        case editExisting
    }
    
    var operation: Function = .addNew
    var onSave: (Event) -> Void
    
    @State var event: Event
    @Environment(\.presentationMode) var presentationMode
    
    init(editEvent: Event?, onSave: @escaping (Event) -> Void) {
        if let event = editEvent {
            self.operation = .editExisting
            self.event = event
        } else {
            self.operation = .addNew
            self.event = Event(title: "", date: Date(), textColor: .primary)
        }
        self.onSave = onSave
    }
    
    func validate() -> Bool {
        event.title.isEmpty == false
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $event.title)
                        .foregroundStyle(event.textColor)
                        .disableAutocorrection(true)
                    ColorPicker("Text Color", selection: $event.textColor)
                    DatePicker("Event Date", selection: $event.date)
                }
            }
            .navigationTitle(operation == .addNew ? "Add Event" : "Edit \(event.title)")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Save") {
                        onSave(event)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(validate() == false)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    EventForm( editEvent: nil, onSave: { event in
        print("\(event)")
    })
}
