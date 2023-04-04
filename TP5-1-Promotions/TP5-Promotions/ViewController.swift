//
//  ViewController.swift
//  TP5-Promotions
//
//  Created by Louis Lubineau on 03/04/2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var lblPromotion: UILabel!
    var promotion: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let etudiant = Etudiant.init(entity: NSEntityDescription.entity(
        forEntityName: "Etudiant", in:managedContext)!,
        insertInto: managedContext)
        
        let etudiant2 = Etudiant.init(entity: NSEntityDescription.entity(
        forEntityName: "Etudiant", in:managedContext)!,
        insertInto: managedContext)
        
        etudiant2.nom = "Smith"
        etudiant2.prenom = "Jonh"
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "yyyy/MM/dd"
        etudiant2.dateNaissance = formatter2.date(from: "2000/10/08")
        etudiant2.formation = "LP"
        etudiant2.redoublement = true
        
        let enseignant = Enseignant.init(entity: NSEntityDescription.entity(
        forEntityName: "Enseignant", in:managedContext)!,
        insertInto: managedContext)
        
        etudiant.nom = "Lubineau"
        etudiant.prenom = "Louis"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        etudiant.dateNaissance = formatter.date(from: "2000/10/08")
        etudiant.formation = "LP"
        etudiant.redoublement = true
        
        enseignant.nom = "Guinaudeau"
        enseignant.prenom = "Camille"
        enseignant.isChercheur = true
        
        enseignant.addToEnseigne(etudiant)
        etudiant.addToSuitLesCours(enseignant)
        print(etudiant)
        print(enseignant)
         
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Etudiant")
    
        let filter = "Smith"
        let commitPredicate = NSPredicate(format: "nom == %@", filter)
        fetchRequest.predicate = commitPredicate
        
        do {
            promotion = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
               print("Erreur lors de la récupération des données \(error), \(error.userInfo)")
        }
        printPromotion()
    }

    @IBAction func saveAction(_ sender: Any) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
            }
        	
        let managedContext = appDelegate.persistentContainer.viewContext
                
        let etudiant = NSManagedObject.init(entity: NSEntityDescription.entity(
        forEntityName: "Etudiant", in:managedContext)!,
        insertInto: managedContext)
        
        etudiant.setValue(txtNom.text ?? "", forKeyPath: "nom")
        
        do {
            try managedContext.save()
            promotion.append(etudiant)
        } catch let error as NSError {
            print("Erreur d'enregistrement :  \(error), \(error.userInfo)")
        }
        txtNom.text = nil
        printPromotion()
    }
    
    func printPromotion() {
        var s : String = ""
        for etudiant in promotion {
            s += (etudiant.value(forKeyPath: "nom") as! String) + " "
            s += (etudiant.value(forKeyPath: "prenom") as! String) + " \n"
        }
        lblPromotion.text = s
    }
    
    
}

