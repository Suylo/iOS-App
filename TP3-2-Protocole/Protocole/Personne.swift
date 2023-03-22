//
//  Personne.swift
//  TP2
//
//  Created by Camille Guinaudeau on 21/01/2022.
//  Copyright © 2017 Camille Guinaudeau. All rights reserved.
//

import Foundation

class Personne {
    var id: Int
    var genre: String
    var nom: String
    var prenom: String
    var adresseMail: String
    var telephone: String
    var description: String {
        return "\(genre) \(nom) \(prenom)\nAdresse mail : \(adresseMail)\nTelephone: \(telephone)"
    }
    
    init(id: Int, genre: String, nom: String, prenom: String, adresseMail: String, telephone: String) {
        self.id = id
        self.genre = genre
        self.nom = nom
        self.prenom = prenom
        self.adresseMail = adresseMail
        self.telephone = telephone
    }
    
    convenience init() {
        self.init(id: 0, genre: "M", nom:"Smith", prenom:"John", adresseMail: "john.smith@u-psud.fr", telephone: "0231653968")
    }
}
