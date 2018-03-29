//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FactTableViewController: UITableViewController {
    let factCellIdentifier: String = "FactCell"
    var Planet: Planet!
    
    override func viewDidLoad () {
        super.viewDidLoad()
        self.title = Planet.name
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Planet.facts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactCell", for: indexPath) as! FactTableViewCell
        cell.factTextView.text = Planet.facts[indexPath.row]
        
        return cell
    }
}
