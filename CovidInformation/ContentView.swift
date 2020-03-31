//
//  ContentView.swift
//  CovidInformation
//
//  Created by Fernando Gomes on 28/03/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            GlobalView().tabItem {
                Image(systemName: "globe")
                Text("Global")
            }
            CountriesView().tabItem {
                Image(systemName: "flag.fill")
                Text("Countries")
            }
        }
    }
}

struct GlobalView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        List {
            VStack {
                Text("Global").font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Corona Virus cases")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(getValue(data: networkManager.global?.cases ?? 0))
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Text("Global")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Deaths")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(getValue(data: networkManager.global?.deaths ?? 0))
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Text("Global")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Recovered")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(getValue(data: networkManager.global?.recovered ?? 0))
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
}

struct CountriesView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            List(networkManager.countries.filter {
                self.searchText.isEmpty ? true : "\($0)".contains(self.searchText)
            }, id: \.country) { country in
                VStack {
                    Text(country.country)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Cases: \(country.cases) | Today: \(country.todayCases) | Active: \(country.active)")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Deaths: \(country.deaths) | Today: \(country.todayDeaths)")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Recovered: \(country.recovered) | Critical: \(country.critical)")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

func getValue(data: Int) -> String {
    let format = NumberFormatter()
    format.numberStyle = .decimal
    
    return format.string(from: NSNumber(value: data)) ?? ""
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
