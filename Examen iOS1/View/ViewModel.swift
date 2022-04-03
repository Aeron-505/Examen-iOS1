//
//  ViewModel.swift
//  Examen iOS1
//
//  Created by Aeron on 29/03/22.
//

import Foundation

final class ViewModel {
    
    func executeAPI() {
        let urlSession = URLSession.shared
        let url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")

        urlSession.dataTask(with: url!) { data, response, error in
            print("􀃯 Data \(String(describing: data))")
            print("􀥺 Response \(String(describing: data))")
           
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                print(String(describing: json))
                
            }
             
            print("􀮷 Error \(String(describing: data))")

        }.resume()
        
    }
}

