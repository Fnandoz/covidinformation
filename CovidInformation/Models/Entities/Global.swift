//
//  Global.swift
//  CovidInformation
//
//  Created by Fernando Gomes on 28/03/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Global: Decodable {
    var cases: Int
    var deaths: Int
    var recovered: Int
}
