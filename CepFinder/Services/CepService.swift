//
//  CadastroService.swift
//  CepFinder
//
//  Created by Virtual Machine on 15/06/22.
//

import Foundation

protocol CepServiceProtocol {
    func cepSuccess(endereco: Endereco)
    func cepError(messege: String)
}

class CepService {
    
    var delegate: CepServiceProtocol?
    
    let apiUrl = "https://viacep.com.br/ws/";
    
    func callCep(cep: String) {
        let url = apiUrl + cep + "/json/"
        
        performResquest(url: url)
    }
    
    func performResquest(url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            request.httpMethod = "GET"
            
            let task = session.dataTask(with: request) { data, response, error  in
                if error != nil {
                    self.delegate?.cepError(messege: "Erro ao chamar API")
                    return
                }
                
                if let safeData = data {
                    do {
                        let cep = try JSONDecoder().decode(Endereco.self, from: safeData)
                        self.delegate?.cepSuccess(endereco: cep)
                    } catch {
                        return
                    }
                }
            }
            
            task.resume()
        }
    }
}
