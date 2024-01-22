//
//  DateEntryView.swift
//  CountDownApp
//
//  Created by Andres Made on 1/21/24.
//

import SwiftUI

struct NewEventView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var eventTitle: String = ""
    @State private var eventDate: Date = .now
    
   
    
    
    var body: some View {
        Form {
            Section("Event Name") {
                TextField("Event Name", text: $eventTitle)
            }
            
            Section("Select Event Date") {
                DatePicker("Event Date", selection: $eventDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            
        }
        .navigationTitle("Create New Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let newEvent = Event(title: eventTitle, eventDate: eventDate, timeRemaining: "")
                    modelContext.insert(newEvent)
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }

        }
    }
}

#Preview {
    NavigationStack {
        NewEventView()
    }
}
