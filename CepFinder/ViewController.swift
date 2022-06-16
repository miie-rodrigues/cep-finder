//
//  ViewController.swift
//  CepFinder
//
//  Created by Virtual Machine on 15/06/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CepServiceProtocol {

    @IBOutlet weak var cepLabel: UILabel!
    @IBOutlet weak var cepField: UITextField!
    
    @IBOutlet weak var ruaLabel: UILabel!
    @IBOutlet weak var ruaField: UITextField!
    
    @IBOutlet var bairroLabel: UILabel!
    @IBOutlet weak var bairroField: UITextField!
    
    @IBOutlet weak var cidadeLabel: UILabel!
    @IBOutlet weak var cidadeField: UITextField!
    
    @IBOutlet weak var estadoLabel: UILabel!
    @IBOutlet weak var estadoField: UITextField!
    
    let service = CepService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service.delegate = self
        cepField.delegate = self
       
    }

    func cepSuccess(endereco: Endereco) {
        
    }
    
    func cepError(messege: String) {
        
    }

}

