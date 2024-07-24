//
//  WeeCompanyAppApp.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 22/07/24.
//
import SwiftUI

@main
struct WeeCompanyAppApp: App {
    
    @ObservedObject var navigationRouter = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationRouter.navPath) {
                ContentView()
                    .navigationDestination(for: NavigationRouter.Destination.self) { destination in
                        switch destination {
                        case .countryList:
                            CountryListView()
                        case .countrySearch:
                            CountrySearchView()
                        case .countryDetail(let CountryModel):
                            CountryDetailView(countryModel: CountryModel)
                        }
                    }
            }
            .environmentObject(navigationRouter)
        }
    }
}
