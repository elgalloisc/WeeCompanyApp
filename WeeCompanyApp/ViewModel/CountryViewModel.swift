//
//  CountryViewModel.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 23/07/24.
//

import Foundation

class CountryViewModel: ObservableObject {
    
    @Published var countries: [CountryModel] = []
        
    func getCountries() {
        let url = URL(string: "https://restcountries.com/v3.1/all")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let countryArray = try JSONDecoder().decode([CountryModel].self, from: data)
                DispatchQueue.main.async{
                    self.countries = countryArray
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }
        
        task.resume()
    }
    
    func searchByName(name: String, completion: @escaping (CountryModel?, Error?) -> Void) {
        
        let url = URL(string: "https://restcountries.com/v3.1/name/" + name)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                completion(nil, error)
            }
            
            guard let data = data else {
                return
            }
                        
            do {
                let countryArray = try JSONDecoder().decode([CountryModel].self, from: data)
                completion(countryArray.first, nil)
                
            } catch let jsonError {
                completion(nil, jsonError)
                print(jsonError)
            }
        }
        
        task.resume()
    }
    
}

