//
//  WorldResponseModel.swift
//  CV19Tracker
//
//  Created by Macky Ramirez on 5/25/20.
//  Copyright © 2020 Macky Ramirez. All rights reserved.
//
import Foundation
// MARK: - WorldResponseModelElement
struct WorldResponseModelElement: Codable {
    let country: String?
    let cases, todayCases, deaths, todayDeaths: Int?
    let recovered, active: Int?
    let critical, casesPerOneMillion, deathsPerOneMillion, totalTests: Int?
    let testsPerOneMillion: Int?
}
// MARK: WorldResponseModelElement convenience initializers and mutators
extension WorldResponseModelElement {
    init(data: Data) throws {
        self = try JSONSchemaSupport().newJSONDecoder().decode(WorldResponseModelElement.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func with(
        country: String?? = nil,
        cases: Int?? = nil,
        todayCases: Int?? = nil,
        deaths: Int?? = nil,
        todayDeaths: Int?? = nil,
        recovered: Int?? = nil,
        active: Int?? = nil,
        critical: Int?? = nil,
        casesPerOneMillion: Int?? = nil,
        deathsPerOneMillion: Int?? = nil,
        totalTests: Int?? = nil,
        testsPerOneMillion: Int?? = nil
    ) -> WorldResponseModelElement {
        return WorldResponseModelElement(
            country: country ?? self.country,
            cases: cases ?? self.cases,
            todayCases: todayCases ?? self.todayCases,
            deaths: deaths ?? self.deaths,
            todayDeaths: todayDeaths ?? self.todayDeaths,
            recovered: recovered ?? self.recovered,
            active: active ?? self.active,
            critical: critical ?? self.critical,
            casesPerOneMillion: casesPerOneMillion ?? self.casesPerOneMillion,
            deathsPerOneMillion: deathsPerOneMillion ?? self.deathsPerOneMillion,
            totalTests: totalTests ?? self.totalTests,
            testsPerOneMillion: testsPerOneMillion ?? self.testsPerOneMillion
        )
    }
    func jsonData() throws -> Data {
        return try JSONSchemaSupport().newJSONEncoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
typealias WorldResponseModel = [WorldResponseModelElement]
extension Array where Element == WorldResponseModel.Element {
    init(data: Data) throws {
        self = try JSONSchemaSupport().newJSONDecoder().decode(WorldResponseModel.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func jsonData() throws -> Data {
        return try JSONSchemaSupport().newJSONEncoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
