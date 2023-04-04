//
//  ViewController.swift
//  PlanningRecette
//
//  Created by Camille Guinaudeau on 25/02/2020.
//  Copyright © 2020 Camille Guinaudeau. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // Variables
    var jourCourant : String = ""
    var recetteCourante : Recette = Recette()
    var planning : Planning = Planning()
    
    // Outlets
    @IBOutlet weak var lblLundi: UILabel!
    @IBOutlet weak var lblMardi: UILabel!
    @IBOutlet weak var lblMercredi: UILabel!
    @IBOutlet weak var lblJeudi: UILabel!
    @IBOutlet weak var lblVendredi: UILabel!
    @IBOutlet weak var lblSamedi: UILabel!
    @IBOutlet weak var lblDimanche: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Question 6 - à completer
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let planning = Planning(entity: NSEntityDescription.entity(forEntityName: "Planning", in:managedContext)!,insertInto: managedContext)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addRecetteLundi") {
            let destinationVC = segue.destination as! ChooseRecetteViewController
            destinationVC.jourdelarecette = "lundi"
        }
        if (segue.identifier == "addRecetteMardi") {
            let destinationVC = segue.destination as! ChooseRecetteViewController
            destinationVC.jourdelarecette = "mardi"
        }
        if (segue.identifier == "addRecetteMercredi") {
            let destinationVC = segue.destination as! ChooseRecetteViewController
            destinationVC.jourdelarecette = "mercredi"
        }
        if (segue.identifier == "addRecetteJeudi") {
            let destinationVC = segue.destination as! ChooseRecetteViewController
            destinationVC.jourdelarecette = "jeudi"
        }
        if (segue.identifier == "addRecetteVendredi") {
            let destinationVC = segue.destination as! ChooseRecetteViewController
            destinationVC.jourdelarecette = "vendredi"
        }
        if (segue.identifier == "addRecetteSamedi") {
            let destinationVC = segue.destination as! ChooseRecetteViewController
            destinationVC.jourdelarecette = "samedi"
        }
        if (segue.identifier == "addRecetteDimanche") {
            let destinationVC = segue.destination as! ChooseRecetteViewController
            destinationVC.jourdelarecette = "dimanche"
        }
    }
    
    @IBAction func enregistrerPlanning(_ sender: Any) {
        // Question 7
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let planning = Planning(entity: NSEntityDescription.entity(forEntityName: "Planning", in:managedContext)!,insertInto: managedContext)
        planning.nomPlanning = "Planning"
        planning.addToEstCompose(recetteCourante)
        
        do {
            try managedContext.save()
            print("Planning enregistré")

        } catch let error as NSError {
            print("Erreur d'enregistrement :  \(error), \(error.userInfo)")
        }
        print(planning)
    }

    @IBAction func recetteValidee(segue : UIStoryboardSegue) {
        print("La recette est validée")
        affichagePlanning(nomJour: jourCourant, nomRecette: recetteCourante.nom!)

        // Question 8
    }
    
    @IBAction func recetteAnnulee(segue : UIStoryboardSegue) {
        print("La recette est annulée")
    }
    
    func affichagePlanning(nomJour: String, nomRecette: String) {
        switch nomJour {
        case "lundi" :
            lblLundi.text = "Lundi\n"+nomRecette
        case "mardi" :
            lblMardi.text = "Mardi\n"+nomRecette
        case "mercredi" :
            lblMercredi.text = "Mercredi\n"+nomRecette
        case "jeudi" :
            lblJeudi.text = "Jeudi\n"+nomRecette
        case "vendredi" :
            lblVendredi.text = "Vendredi\n"+nomRecette
        case "samedi" :
            lblSamedi.text = "Samedi\n"+nomRecette
        case "Dimanche" :
            lblDimanche.text = "Dimanche\n"+nomRecette
        default:
            print("OK")
        }
    }
}

