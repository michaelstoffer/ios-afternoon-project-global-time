//
//  ClockTableViewCell.swift
//  Global Time
//
//  Created by Michael Stoffer on 6/27/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets and Properties
    @IBOutlet var timezoneNameLabel: UILabel!
    @IBOutlet var clockView: ClockView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - IBActions and Methods

}
