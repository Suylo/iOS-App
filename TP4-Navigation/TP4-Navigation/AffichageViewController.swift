//
//  AffichageViewController.swift
//  TP4-Navigation
//
//  Created by Louis Lubineau on 28/03/2023.
//

import UIKit

class AffichageViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var tableauAffichage: Array<String> = []

    
    override func viewDidLoad() {
        let countTab = tableauAffichage.count
        if (countTab < 1){
            label.textColor = UIColor.red
            label.text = "Aucune donnée n'existe dans le tableau !"
        } else {
            tableauAffichage.forEach {
                label.text! += "\($0),"
            }
        }

    }
}
