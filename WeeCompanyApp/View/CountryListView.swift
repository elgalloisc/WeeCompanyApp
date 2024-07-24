//
//  CountryListView.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 23/07/24.
//

import SwiftUI

struct CountryListView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    @ObservedObject var countryViewModel = CountryViewModel()
    
    var body: some View {
        
        VStack {
            Section {
                List(countryViewModel.countries, id: \.name.official) { country in
                    CountryItemView(countryModel: country)
                        .onTapGesture {
                            navigationRouter.navigate(to: .countryDetail(countryModel: country))
                        }
                }
            }
            .navigationTitle("Selecciona un país")
        }
        .onAppear() {
            print("getCountries")
            countryViewModel.getCountries()
        }
    }
}
