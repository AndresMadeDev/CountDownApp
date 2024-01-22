//
//  Event.swift
//  CountDownApp
//
//  Created by Andres Made on 1/21/24.
//

import SwiftUI
import SwiftData

@Model
class Event {
    var title: String
    var eventDate: Date
    var timeRemaining: String
    
    init(title: String, eventDate: Date, timeRemaining: String) {
        self.title = title
        self.eventDate = eventDate
        self.timeRemaining = timeRemaining
    }
    
}
