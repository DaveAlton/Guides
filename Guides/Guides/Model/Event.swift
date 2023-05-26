//
//  Event.swift
//  Guides
//
//  Created by Dave Alton on 2023-05-26.
//

import Foundation

struct Event: Codable {
    let startDate: Date
    let endDate: Date
    let name: String
    let url: String
    let venue: Venue
    let objType: String
    let icon: URL

    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter
    }()
}
