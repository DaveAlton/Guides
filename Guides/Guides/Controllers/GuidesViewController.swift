//
//  ViewController.swift
//  Guides
//
//  Created by Dave Alton on 2023-05-26.
//

import UIKit

class GuidesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var viewModel = GuidesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await viewModel.fetchEvents()
            tableView.reloadData()
        }
    }
}

extension GuidesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dates.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = viewModel.dates[section]
        return Event.dateFormatter.string(from: date)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let date = viewModel.dates[section]
        return viewModel.eventsForDate[date]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventCell else {
            return UITableViewCell()
        }

        let date = viewModel.dates[indexPath.section]
        guard let event = viewModel.eventsForDate[date]?[indexPath.row] else {
            return UITableViewCell()
        }

        cell.nameLabel.text = event.name
        cell.dateLabel.text = Event.dateFormatter.string(from: event.endDate)

        if let city = event.venue.city, let state = event.venue.state {
            let combinedString = city + ", " + state
            cell.locationLabel.text = combinedString
        } else {
            cell.locationLabel.text = event.venue.city ?? event.venue.state ?? ""
        }

        return cell
    }
}
