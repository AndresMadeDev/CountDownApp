//
//  EventCell.swift
//  CountDownApp
//
//  Created by Andres Made on 1/21/24.
//

import SwiftUI

struct EventCell: View {
    @Bindable var event: Event
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.day, .minute, .second], from: .now, to: event.eventDate)
        
        let day = remaining.day ?? 0
        event.timeRemaining = "\(day)"
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(event.title)
                .bold()
            VStack(spacing: -10) {
                Text(event.timeRemaining)
                    .font(.system(size: 75, weight: .bold, design: .rounded))
                    .bold()
                Text("Days Remaining")
                    .font(.caption)
            }
            
            Text(event.eventDate.formatted(.dateTime.month().day()))
        }
        .padding()
        .frame(minWidth: 150)
        .foregroundStyle(.white)
        .background(.blue.gradient)
        .clipShape(RoundedRectangle(cornerRadius: 20))
//        HStack {
//            LabeledContent {
//                VStack {
//                    Text(event.timeRemaining)
//                    Text("Days")
//                        .font(.caption)
//                }
//                .padding()
//                .frame(width: 70, height: 70)
//                .foregroundStyle(.white)
//                .background(.teal)
//                .clipShape(Circle())
//            } label: {
//                VStack(alignment: .leading) {
//                    Text(event.title)
//                        .font(.title)
//                    Text(event.eventDate.formatted(date: .abbreviated, time: .omitted))
//                }
//                
//            }
//        }
        .onReceive(timer) { _ in
            updateTimeRemaining()
        }
    }
}


