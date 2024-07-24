//
//  CountrySearchView.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 23/07/24.
//

import SwiftUI

struct CountrySearchView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    @ObservedObject var countryViewModel = CountryViewModel()
    @State private var showingAlert = false
    @State private var countryName: String = ""
    
    var body: some View {
        
        Form {
            
            Text("Buscar por nombre:")
            
            TextField("Escriba el nombre del país", text: $countryName)
            
            Button("Buscar") {
                countryViewModel.searchByName(name: countryName) { (countryModel, error) in
                    if let countryModel = countryModel {
                        navigationRouter.navigate(to: .countryDetail(countryModel: countryModel))
                    } else {
                        showingAlert = true
                    }
                }
            }
        }
        .alert("No se encontró el país que estas buscando", isPresented: $showingAlert) {
            Button("Entendido") { }
        }
    }
}
