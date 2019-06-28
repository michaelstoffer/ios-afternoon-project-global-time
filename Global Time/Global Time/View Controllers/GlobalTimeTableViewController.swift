//
//  GlobalTimeTableViewController.swift
//  Global Time
//
//  Created by Michael Stoffer on 6/27/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

protocol TimeZoneDelegate: class {
    func didChooseTimeZone(_ timezone: String)
}

class GlobalTimesTableViewController: UITableViewController {
    
    var timezones: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Global Time"
        self.timezones.append(TimeZone.current.identifier)
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.timezones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell", for: indexPath) as? ClockTableViewCell else { return UITableViewCell() }

        let tzIdentifier = self.timezones[indexPath.row]
        cell.clockView.timezone = TimeZone.init(identifier: tzIdentifier)
        cell.timezoneNameLabel.text = String(tzIdentifier.split(separator: "/").last!)

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTimezones" {
            guard let timeZonesTVC = segue.destination as? TimeZonesTableViewController else { return }
            timeZonesTVC.delegate = self
        }
    }
}

extension GlobalTimesTableViewController: TimeZoneDelegate {
    func didChooseTimeZone(_ timezone: String) {
        dismiss(animated: true) {
            self.timezones.append(timezone)
            self.tableView.reloadData()
        }
    }
}
