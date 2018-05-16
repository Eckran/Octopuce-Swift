//
//  ContactTableViewCell.swift
//  Otcopuce
//
//  Created by Romain Gary on 15/05/2018.
//  Copyright © 2018 Romain Gary. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var TelButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func PressCall(_ sender: UIButton) {
        if let phoneCallURL = URL(string: "tel://0677461561") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
}
