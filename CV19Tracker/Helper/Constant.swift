//
//  Constant.swift
//  CV19Tracker
//
//  Created by Macky Ramirez on 5/25/20.
//  Copyright © 2020 Macky Ramirez. All rights reserved.
//
import Foundation
struct BasePath {
    static let baseUrl      = "https://coronavirus-19-api.herokuapp.com"
}
struct Path {
    static let all          = "/all"
    static let countries    = "/countries"
    static let countryName  = "/countries/\(URLParameters.name)"
}
struct URLParameters {
    static let name         = "$[countryname]"
}
