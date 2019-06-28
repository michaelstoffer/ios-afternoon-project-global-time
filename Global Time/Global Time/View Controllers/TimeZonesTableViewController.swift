//
//  TimeZonesTableViewController.swift
//  Global Time
//
//  Created by Michael Stoffer on 6/27/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class TimeZonesTableViewController: UITableViewController {
    
    let knownTimezones = TimeZone.knownTimeZoneIdentifiers
    
    weak var delegate: TimeZoneDelegate?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.knownTimezones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimezoneCell", for: indexPath)

        let tzIdentifier = self.knownTimezones[indexPath.row]
        cell.detailTextLabel?.text = String(tzIdentifier.split(separator: "/").last!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didChooseTimeZone(self.knownTimezones[indexPath.row])
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
