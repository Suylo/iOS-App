//
//  RecetteViewController.swift
//  PlanningRecette
//
//  Created by Camille Guinaudeau on 25/02/2020.
//  Copyright © 2020 Camille Guinaudeau. All rights reserved.
//

import UIKit
import CoreData

class RecetteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Variables
    var listeIngredient : [(String, String)] = []
    
    // Outlets
    @IBOutlet weak var tableIngredients: UITableView!
    @IBOutlet weak var txtNomRecette: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableIngredients.delegate = self
        tableIngredients.dataSource = self
    }
    
    // Création de l'alerte permettant d'ajouter les ingrédients de la recette
    @IBAction func ajoutIngredients(_ sender: Any) {
        // création de l'alerte
        let alert = UIAlertController(title: "Ingrédients", message: "Ajouter un ingrédient et sa quantité", preferredStyle: UIAlertController.Style.alert)
        
        // ajout des champs de texte (initialisation des placeholder)
        alert.addTextField()
        alert.addTextField()
        alert.textFields![0].placeholder = "ingrédient"
        alert.textFields![1].placeholder = "quantité"
        
        // ajout des boutons
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            self.listeIngredient.append((alert.textFields![0].text!, alert.textFields![1].text!))
            self.tableIngredients.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Annuler", style: UIAlertAction.Style.cancel, handler: nil))
        
        // affichage de l'alerte
        self.present(alert, animated: true, completion: nil)
    }
    
    // Nombre de ligne de la tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listeIngredient.count
    }
    
    // Remplissage de la table tableIngredients
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (ing, quant) = listeIngredient[indexPath.row]
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier:
            cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier:cellIdentifier)
        cell.textLabel?.text = ing
        cell.detailTextLabel?.text = quant
        return cell
    }
    
    @IBAction func enregistrerRecette(_ sender: Any) {
        // Enregistrement des données
        // Question 2
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
        let managedContext = appDelegate.persistentContainer.viewContext
                
        let recette = Recette(entity: NSEntityDescription.entity(
        forEntityName: "Recette", in:managedContext)!,
        insertInto: managedContext)
        
        recette.nom = txtNomRecette.text
        
        for (nom, quantite) in listeIngredient {
            let ingredientObj = Ingredient(entity: NSEntityDescription.entity(
                forEntityName: "Ingredient", in:managedContext)!,
                insertInto: managedContext)
            ingredientObj.nom = nom
            ingredientObj.quantite = Float(quantite)!
            recette.addToEstComposee(ingredientObj)
        }
            
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Erreur d'enregistrement :  \(error), \(error.userInfo)")
        }
        
        // Nettoyage de l'interface graphique
        txtNomRecette.text = ""
        txtNomRecette.placeholder = ""
        listeIngredient = []
        tableIngredients.reloadData()
    }
}
