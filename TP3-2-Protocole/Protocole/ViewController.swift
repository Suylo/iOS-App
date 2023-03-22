//
//  ViewController.swift
//  Protocole
//
//  Created by Camille Guinaudeau on 21/01/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var choixCivilite: UISegmentedControl!
    @IBOutlet weak var textNom: UITextField!
    @IBOutlet weak var textId: UITextField!
    @IBOutlet var textPrenom: UITextField!
    @IBOutlet var textAdresseMail: UITextField!
    @IBOutlet var textTelephone: UITextField!
    @IBOutlet weak var btnEnregistrer: UIButton!
    @IBOutlet var affichageNouvellePersonne: UILabel!
    @IBOutlet var erreurNom: UILabel!
    @IBOutlet var erreurPrenom: UILabel!
    @IBOutlet var erreurMail: UILabel!
    @IBOutlet var erreurTelephone: UILabel!
    @IBOutlet weak var erreurId: UILabel!
    var dict_personnes: [Int: Personne] = [:]
    var genrePersonne: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let personne1 = Personne()
        let personne2 = Personne(id: 2, genre: "F", nom: "Dupont", prenom: "Marie", adresseMail: "marie.dupont@u-psud.fr", telephone: "0695858687")
        print((personne1.description))
        print((personne2.description))
        
        choixCivilite.selectedSegmentIndex = UISegmentedControl.noSegment
        
        textId.delegate = self
        textNom.delegate = self
        textPrenom.delegate = self
        textAdresseMail.delegate = self
        textTelephone.delegate = self
        btnEnregistrer.isEnabled = false
        
        erreurNom.text = ""
        erreurPrenom.text = ""
        erreurMail.text = ""
        erreurTelephone.text = ""
        erreurId.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let adrVal = textAdresseMail.text
        let phoneVal = textTelephone.text
        if (textField == textAdresseMail) {
            if (!valideMail(adrVal!)) {
                erreurMail.text = "ex.ex@g.com"
                return false
            }
        }
        if (textField == textTelephone) {
            if (!valideTelephone(phoneVal!)){
                erreurTelephone.text = "1234567891"
                return false
            }
        }
        erreurMail.text = ""
        erreurTelephone.text = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("DidEndEditing : " + textField.text!)

    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (textId.text != "" && textNom.text != "" && textPrenom.text != "" && textAdresseMail.text != "" && textTelephone.text != "" && genrePersonne != "" && valideMail(textAdresseMail.text!) && valideTelephone(textTelephone.text!)){
            btnEnregistrer.isEnabled = true
        } else {
            btnEnregistrer.isEnabled = false
        }
    }
    
    @IBAction func typeSegment(_ sender: Any) {
        genrePersonne = "\(choixCivilite.selectedSegmentIndex)"
        
        if (textId.text != "" && textNom.text != "" && textPrenom.text != "" && textAdresseMail.text != "" && textTelephone.text != "" && genrePersonne != ""){
            btnEnregistrer.isEnabled = true
        } else {
            btnEnregistrer.isEnabled = false
        }
    }
    
    func valideMail(_ mail: String) -> Bool {
        let mailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let mailPred = NSPredicate(format:"SELF MATCHES %@", mailRegEx)
        return mailPred.evaluate(with: mail)
    }
    
    func valideTelephone(_ telephone: String) -> Bool {
        let telephoneRegEx = "^\\d{10}$"
        let telephonePred = NSPredicate(format:"SELF MATCHES %@", telephoneRegEx)
        return telephonePred.evaluate(with: telephone)
    }
    
    @IBAction func enregistrer(_ sender: AnyObject) {
    
        var g = "M"
        if (choixCivilite.selectedSegmentIndex == 0) {
            g = "M"
        }
        if (choixCivilite.selectedSegmentIndex == 1) {
            g = "F"
        }
        if (choixCivilite.selectedSegmentIndex == 2) {
            g = "Non binaire"
        }
        
        let personne = Personne()
        personne.id = Int(textId.text!)!
        personne.genre = g
        personne.nom = textNom.text!
        personne.prenom = textPrenom.text!
        personne.adresseMail = textAdresseMail.text!
        personne.telephone = textTelephone.text!
        
        affichageNouvellePersonne.text = "\(personne.description)"
        dict_personnes[personne.id] = personne
        print("Nous avons enregistré \(dict_personnes.count) personnes, les voici : ")
        for (id, pers) in dict_personnes {
            print(id)
            print(pers.description)
        }
        
        self.cleanInterface()
        
    }
    
    func cleanInterface() {
        textTelephone.resignFirstResponder()
        
        textId.text = ""
        textNom.text = ""
        textPrenom.text = ""
        textAdresseMail.text = ""
        textTelephone.text = ""
        choixCivilite.selectedSegmentIndex = UISegmentedControl.noSegment
        
        erreurId.text = ""
        erreurNom.text = ""
        erreurPrenom.text = ""
        erreurMail.text = ""
        erreurTelephone.text = ""
    }
}


