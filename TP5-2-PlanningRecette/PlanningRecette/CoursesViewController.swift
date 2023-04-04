//
//  CoursesViewController.swift
//  PlanningRecette
//
//  Created by Camille Guinaudeau on 25/02/2020.
//  Copyright © 2020 Camille Guinaudeau. All rights reserved.
//

import UIKit
import CoreData

class CoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Variables
    var listeCourses : [(String, String)] = []
    var dictCourses : [String: Float] = [:]
    var listeRecettes : [NSManagedObject] = []
    
    // Outlets
    @IBOutlet weak var tableCourses: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableCourses.delegate = self
        tableCourses.dataSource = self
        
        // Question 9
        
    }
    
    // Nombre de ligne de la tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listeCourses.count
    }
    
    // Remplissage de la table tableCourses
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (ing, quant) = listeCourses[indexPath.row]
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier:
            cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier:cellIdentifier)
        cell.textLabel?.text = ing
        cell.detailTextLabel?.text = quant
        return cell
    }

}
