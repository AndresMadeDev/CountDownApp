//
//  ContentView.swift
//  CountDownApp
//
//  Created by Andres Made on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
//    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    @State var timeRemaining: String = ""
    @State var future: Date = .now
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.day, .minute, .second], from: .now, to: future)
        
        let day = remaining.day ?? 0
        timeRemaining = "\(day): days"
    }
    
    var body: some View {
        Form {
            DatePicker("Pick a date", selection: $future, displayedComponents: .date)
                .datePickerStyle(.graphical)
            
            Text(timeRemaining)
                .font(.largeTitle)
        }
        .padding()
        .onReceive(timer, perform: { _ in
            updateTimeRemaining()
        })
    }
}

#Preview {
    ContentView()
}
