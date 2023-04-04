//
//  ChooseRecetteViewController.swift
//  PlanningRecette
//
//  Created by Camille Guinaudeau on 25/02/2020.
//  Copyright © 2020 Camille Guinaudeau. All rights reserved.
//

import UIKit
import CoreData

class ChooseRecetteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Variables
    var jourdelarecette : String = ""
    
    var listeRecettes : [NSManagedObject] = []
    var recetteChoisie : Recette = Recette()

    // Outlets
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var tableRecette: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titre.text = "Choisissez une recette pour "+jourdelarecette
        
        tableRecette.delegate = self
        tableRecette.dataSource = self
        
        // Question 3 - à completer
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Recette")
        
        do {
            listeRecettes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Erreur lors de la récupération des données \(error), \(error.userInfo)")
        }
        
    }
    
    // Nombre de ligne de la tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listeRecettes.count
    }
    
    // Remplissage de la table tableIngredients
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recette = listeRecettes[indexPath.row]
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier:
            cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier:cellIdentifier)
        
        // Question 5 - à décommenter et à compléter
        cell.textLabel?.text = recette.value(forKey: "nom") as? String
        return cell
    }
    
    // Selection de la recette
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recetteChoisie = listeRecettes[indexPath.row] as! Recette
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "recetteValidee") {
            let destinationVC = segue.destination as! ViewController
            destinationVC.jourCourant = jourdelarecette
            destinationVC.recetteCourante = recetteChoisie
        }
    }
}
