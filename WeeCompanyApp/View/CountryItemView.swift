//
//  CountryItemView.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 23/07/24.
//

import SwiftUI

struct CountryItemView: View {
    
    var countryModel: CountryModel
    
    var body: some View {
        Text(countryModel.name.official)
    }
}
