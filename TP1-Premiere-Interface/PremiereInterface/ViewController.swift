//
//  ViewController.swift
//  PremiereInterface
//
//  Created by Louis Lubineau on 14/02/2023.
//

import UIKit

class ViewController: UIViewController {

    // Texte et Slider
    @IBOutlet weak var texte: UILabel!
    @IBOutlet weak var sliderBtn: UISlider!
    
    // Indicator et bouton
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var bouton: UIButton!
    @IBOutlet weak var switchToggle: UISwitch!
    
    // Segments
    @IBOutlet weak var segmentedControls: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bouton.setTitle("Start", for: .normal)
    }

    // Quand la valeur du slider est modifié, modifie le texte avec la valeur du slider
    @IBAction func onSliderChange(_ sender: Any) {
        let slideVal = sliderBtn.value
        texte.text = "\(slideVal)"
    }
    
    // Action effectué lors du clique sur le bouton
    @IBAction func onClickBtn(_ sender: Any) {
        if indicator.isAnimating {
            indicator.stopAnimating()
            bouton.setTitle("Start", for: .normal)
        } else {
            indicator.startAnimating()
            bouton.setTitle("Stop", for: .normal)
        }
    }
    
    // Action effectuée sur le switch, lorsque son status à été changé
    @IBAction func onSwitchStateChange(_ sender: Any) {
        if switchToggle.isOn {
            bouton.isEnabled = true;
        } else {
            bouton.isEnabled = false;
        }
    }
    
    // Action effectuée lorsque le statut d'un segment a été changé
    @IBAction func onSegmentChange(_ sender: Any) {
        switch segmentedControls.selectedSegmentIndex{
        case 0:
            self.view.backgroundColor = UIColor.systemRed
        case 1:
            self.view.backgroundColor = UIColor.systemBlue
        case 2:
            self.view.backgroundColor = UIColor.systemYellow
        default:
            self.view.backgroundColor = UIColor.white
        }
    }
}
