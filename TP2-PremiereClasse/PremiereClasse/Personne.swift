//
//  Personne.swift
//  TP2-PremiereClasse
//
//  Created by Louis Lubineau on 17/03/2023.
//

import Foundation

class Personne {
    
    private var id : Int
    private var genre : String
    private var nom : String
    private var prenom : String
    private var adresseMail : String
    private var telephone : String
    
    public var description: String {
        return "Nom : " + self.nom + " Prénom : " + self.prenom + " - Genre : " + self.genre
        + " - Adresse mail : " + self.adresseMail + " - Téléphone : " + self.telephone
    }
    
    convenience init(){
        self.init(0, "", "", "", "", "")
    }
    
    init(_ id: Int, _ genre: String, _ nom: String, _ prenom: String, _ adresseMail: String, _ telephone: String){
        self.id = id
        self.genre = genre
        self.nom = nom
        self.prenom = prenom
        self.adresseMail = adresseMail
        self.telephone = telephone
    }
    
    
}
