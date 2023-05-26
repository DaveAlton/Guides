//
//  EventResponse.swift
//  Guides
//
//  Created by Dave Alton on 2023-05-26.
//

import Foundation

struct EventResponse: Codable {
    let total: String
    let data: [Event]
}
