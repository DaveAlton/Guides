//
//  GuidesViewModel.swift
//  Guides
//
//  Created by Dave Alton on 2023-05-26.
//

import UIKit

class GuidesViewModel {
    let urlSession: URLSession
    var eventsForDate = [Date: [Event]]()
    var dates = [Date]()

    func fetchEvents() async {
        guard let url = URL(string: "https://www.guidebook.com/service/v2/upcomingGuides/") else {
            print("Could not form URL.")
            return
        }
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await urlSession.data(for: request)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Event.dateFormatter)
            let eventResponse = try decoder.decode(EventResponse.self, from: data)
            let events = eventResponse.data
            await sort(events: events)
        } catch {
            print(error.localizedDescription)
        }
    }

    func sort(events: [Event]) async {
        for event in events {
            eventsForDate[event.startDate, default: []].append(event)
        }
        dates = eventsForDate.keys.sorted()
    }

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
}
