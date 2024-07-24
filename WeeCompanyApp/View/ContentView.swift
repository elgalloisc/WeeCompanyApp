//
//  ContentView.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 22/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    var body: some View {
        
        NavigationView {
            Form {
                Text("Selecciona una opción:")
                
                Button("Ver paises") {
                    navigationRouter.navigate(to: .countryList)
                }
                
                Button("Buscar por nombre") {
                    navigationRouter.navigate(to: .countrySearch)
                }
            }
            .navigationTitle("Wee Company App")
            .navigationBarTitleDisplayMode(.inline)            
        }
    }
}

#Preview {
    ContentView()
}
