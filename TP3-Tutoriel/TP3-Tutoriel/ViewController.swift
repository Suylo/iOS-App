//
//  ViewController.swift
//  TP3-Tutoriel
//
//  Created by Louis Lubineau on 21/03/2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let data1 : [String] = ["Café", "Thé", "Capuccino", "Tisane"]
    let data2 : [String] = ["chaud", "tiède", "froide"]
    let data3 : [String] = ["sucré", "faiblement sucré", "non sucré"]
    
    var boisson : String = ""
    var chaleur : String = ""
    var sucre : String = ""
    
    override func viewDidLoad() {
        picker.dataSource = self
        picker.delegate = self
        super.viewDidLoad()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        if (component == 0){
            return data1.count
        } else if (component == 1) {
            return data2.count
        } else {
            return data3.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return data1[row]
        } else if (component == 1) {
            return data2[row]
        } else {
            return data3[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            boisson = data1[row]
        } else if (component == 1) {
            chaleur = data2[row]
        } else {
            sucre = data3[row]
        }
    }


    
    @IBAction func btnOnCommand(_ sender: Any) {
        let commande = "\(boisson) \(chaleur) \(sucre)"
        label.text = commande
    }

}

