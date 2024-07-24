//
//  CountryDetailView.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 23/07/24.
//

import SwiftUI
import WebKit

struct CountryDetailView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    @State private var showingFlag = false
    @State private var showingMap = false
    
    var countryModel: CountryModel
    
    var body: some View {
        Form {
            HStack {
                Text("Nombre común: ")
                Text(countryModel.name.common)
            }
            
            HStack {
                Text("Nombre oficial: ")
                Text(countryModel.name.official)
            }
            
            HStack {
                Text("Capital: ")
                Text(countryModel.capital?.first ?? "Capital")
            }
            
            HStack {
                Text("Moneda: ")
                Text(countryModel.currencies?.first?.value.name ?? "Moneda")
            }
            
            Button("Ver imagen de bandera") {
                showingFlag.toggle()
            }
            .sheet(isPresented: $showingFlag) {
                FlagSheetView(urlFlag: countryModel.flags.png)
            }
            
            Button("Ver ubicación del país") {
                showingMap.toggle()
            }
            .sheet(isPresented: $showingMap) {
                NavigationStack {
                    MapSheetView(url: URL(string: countryModel.maps.googleMaps)!)
                        .navigationTitle("Wee Company App")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .navigationTitle("Datos del país seleccionado")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FlagSheetView: View {
    @Environment(\.dismiss) var dismiss
    var urlFlag: String
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
                print("Cerrar bottomSheet de la bandera")
            } label: {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 40, height: 40)
            .padding([.top, .trailing], 10)
        }
        VStack {
            AsyncImage(url: URL(string: urlFlag)) { status in
                switch status {
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                default:
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity)
            .clipShape(.rect(cornerRadius: 25))
        }
    }
}

struct MapSheetView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
