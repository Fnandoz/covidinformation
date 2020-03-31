//
//  Countries.swift
//  CovidInformation
//
//  Created by Fernando Gomes on 28/03/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Country: Decodable {
    var country: String
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recovered: Int
    var active: Int
    var critical: Int
    var casesPerOneMillion: Int
    var deathsPerOneMillion: Int
    var firstCase: String
}
