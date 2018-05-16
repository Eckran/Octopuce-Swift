//
//  ContactViewController.swift
//  Otcopuce
//
//  Created by Romain Gary on 15/05/2018.
//  Copyright © 2018 Romain Gary. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var ContactTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ContactTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ContactViewController: UITableViewDataSource {
    
    func numberOfSections(in ContactTable: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ ContactTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ ContactTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ContactTable.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        //Customize the cell
        cell.textLabel?.text = "name"
        cell.detailTextLabel?.text = "Nickname"
        
        return cell
    }
}
