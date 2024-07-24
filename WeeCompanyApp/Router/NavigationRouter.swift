//
//  NavigationRouter.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 23/07/24.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    
    public enum Destination: Hashable {
        public static func == (lhs: NavigationRouter.Destination, rhs: NavigationRouter.Destination) -> Bool {
            return ObjectIdentifier(NavigationRouter.Destination.self) == ObjectIdentifier(NavigationRouter.Destination.self)
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(NavigationRouter.Destination.self))
        }
        
        case countryList
        case countrySearch
        case countryDetail(countryModel: CountryModel)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
