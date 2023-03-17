//
//  ViewController.swift
//  PremiereClasse
//
//  Created by Louis Lubineau on 17/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nomInput: UITextField!
    @IBOutlet weak var prenomInput: UITextField!
    @IBOutlet weak var telephoneInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var genreInput: UISegmentedControl!
    
    var usersTab: [Int: String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func onClickSave(_ sender: UIButton) {
        let counter = usersTab.count + 1
        let genreVal = genreInput.titleForSegment(at: genreInput.selectedSegmentIndex) ?? "";
        let nomVal = nomInput.text ?? ""
        let prenomVal = prenomInput.text ?? ""
        let telephoneVal = telephoneInput.text ?? ""
        let emailVal = emailInput.text ?? ""
        
        if (genreVal != "" && nomVal != "" && prenomVal != "" && telephoneVal != "" && emailVal != ""){
            let newPersonne = Personne(counter, genreVal, nomVal, prenomVal, telephoneVal, emailVal)
            
            usersTab[counter] = newPersonne.description
            
            usersTab.forEach{ person in
                print(person)
            }
        } else {
            print("Veuillez compléter tous les champs !")
        }
    
        resetInputs()
    
    }
    
    func resetInputs(){
        nomInput.text = ""
        prenomInput.text = ""
        telephoneInput.text = ""
        emailInput.text = ""
        genreInput.selectedSegmentIndex = 0
    }
}

