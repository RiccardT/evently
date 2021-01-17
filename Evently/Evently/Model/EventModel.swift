//
//  EventModel.swift
//  Evently
//
//  Created by Ricardo Carrillo on 12/13/20.
//

import Foundation

struct EventModel: Equatable {
    
    let title: String
    let imageURL: String
    let location: String
    let timeOfEventInUTC: String
    var timeOfEventInLocalFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.initialEventDateFormat
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: Constants.dateFormatterLocaleID)
        guard let utcDate = dateFormatter.date(from: timeOfEventInUTC) else {
            assertionFailure("Failed to create Date object from ISO UTC date string")
            return ""
        }
        dateFormatter.dateFormat = Constants.finalEventDateFormat
        dateFormatter.timeZone = TimeZone.current
        let timeOfEventInLocalFormat: String = dateFormatter.string(from: utcDate)
        return timeOfEventInLocalFormat
    }
    
    static func == (leftEvent: EventModel, rightEvent: EventModel) -> Bool {
        return
            (leftEvent.title == rightEvent.title) &&
            (leftEvent.imageURL == rightEvent.imageURL) &&
            (leftEvent.location == rightEvent.location) &&
            (leftEvent.timeOfEventInUTC == rightEvent.timeOfEventInUTC) &&
            (leftEvent.timeOfEventInLocalFormat == rightEvent.timeOfEventInLocalFormat)
        }
}
