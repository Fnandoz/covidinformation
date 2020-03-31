//
//  NetworkManager.swift
//  CovidInformation
//
//  Created by Fernando Gomes on 28/03/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    @Published var global: Global!
    @Published var countries = [Country]()
    private var baseUrl: URL?
    
    init() {
        self.baseUrl = URL(string: "https://coronavirus-19-api.herokuapp.com")
        globalData()
        countriesData()
    }
    
    func globalData() {
       guard let globalUrl = self.baseUrl?.appendingPathComponent("/all") else { return }
       
       URLSession.shared.dataTask(with: globalUrl) { data, _, error in
           guard let data = data else { return }
           
           if error != nil {
               NSLog(error.debugDescription)
           }
           
           let globalData = try! JSONDecoder().decode(Global.self, from: data)
           DispatchQueue.main.async {
               self.global = globalData
           }
       }.resume()
    }
    
    func countriesData() {
        guard let globalUrl = self.baseUrl?.appendingPathComponent("/countries") else { return }
        
        URLSession.shared.dataTask(with: globalUrl) { data, _, error in
            guard let data = data else { return }
            
            if error != nil {
                NSLog(error.debugDescription)
            }
            
            let globalData = try! JSONDecoder().decode([Country].self, from: data)
            DispatchQueue.main.async {
                self.countries = globalData
            }
        }.resume()
    }
    
    
    
    
    
}
