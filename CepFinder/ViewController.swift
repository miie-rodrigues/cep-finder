//
//  ViewController.swift
//  CepFinder
//
//  Created by Virtual Machine on 15/06/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CepServiceProtocol {

    @IBOutlet weak var cepField: UITextField!
    @IBOutlet weak var ruaField: UITextField!
    @IBOutlet weak var bairroField: UITextField!
    @IBOutlet weak var cidadeField: UITextField!
    @IBOutlet weak var estadoField: UITextField!
    
    let service = CepService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
        cepField.delegate = self
    }
    
    // Cep service
    func cepSuccess(endereco: Endereco) {
        DispatchQueue.main.async {
            self.ruaField.text = endereco.logradouro
            self.bairroField.text = endereco.bairro
            self.cidadeField.text = endereco.localidade
            self.estadoField.text = endereco.uf
        }
    }
    
    func cepError(messege: String) {
        DispatchQueue.main.async {
            print("Cep não encontrado")
        }
    }

    // UITextField
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        service.callCep(cep: textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

