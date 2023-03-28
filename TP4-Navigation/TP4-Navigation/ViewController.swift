//
//  ViewController.swift
//  TP4-Navigation
//
//  Created by Louis Lubineau on 28/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnSeeData: UIButton!
    var tableauValeurs: Array<String> = []

    
    @IBAction func onClickSave(_ sender: Any) {
        if (inputText.text != ""){
            tableauValeurs.append(inputText.text!)
            inputText.text = ""
        } else {
            inputText.placeholder = "Veuillez compléter avant de submit!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "deVue1VersVue2" {
            let destinationValue = segue.destination as! AffichageViewController
            destinationValue.tableauAffichage = tableauValeurs.sorted()
        }
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        resetTab()
        inputText.text = ""
    }
    
    func resetTab(){
        tableauValeurs.removeAll()
    }

}

