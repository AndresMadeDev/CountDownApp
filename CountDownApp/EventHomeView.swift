//
//  EventHomeView.swift
//  CountDownApp
//
//  Created by Andres Made on 1/21/24.
//

import SwiftUI
import SwiftData

struct EventHomeView: View {
    @Query(sort: \Event.eventDate, order: .forward) var events: [Event]
    @State private var showEventEntrhy: Bool = false
    
    let columns = [
           GridItem(.adaptive(minimum: 150))
       ]
  
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(events) { event in
                        VStack {
                            EventCell(event: event)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Create New Event") {
                        showEventEntrhy.toggle()
                    }
                }
            }
            .sheet(isPresented: $showEventEntrhy, content: {
                NavigationStack {
                    NewEventView()
                }
            })
        }
    }
}

#Preview {
    EventHomeView()
}
