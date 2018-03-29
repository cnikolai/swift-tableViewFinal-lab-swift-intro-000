//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    var planetCellIdentifier:String = "PlanetCell"
    var planets = [Planet]()
    
    func generatePlanetInfo () {
        planets.append(Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.","Earth has a powerful magnetic field.","Earth was once believed to be the center of the universe."]))
        planets.append(Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.","Mars is home to the tallest mountain in the solar system.","Pieces of Mars have fallen to Earth."]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "PlanetDetailView" { return }
        if let dest = segue.destination as? FactTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            dest.Planet = planets[(indexPath as NSIndexPath).row]
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetTableViewCell
        cell.planetNameLabel.text = planets[indexPath.row].name
        cell.numberOfMoonsLabel.text = String(planets[indexPath.row].numberOfMoons)
        cell.numberOfDaysFullOrbitLabel.text = String(planets[indexPath.row].fullOrbit)
        cell.numberOfFactsLabel.text = String(planets[indexPath.row].facts.count) + " facts"
        
        return cell
    }
}
