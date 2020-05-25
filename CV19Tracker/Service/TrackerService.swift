//
//  TrackerService.swift
//  CV19Tracker
//
//  Created by Macky Ramirez on 5/25/20.
//  Copyright © 2020 Macky Ramirez. All rights reserved.
//
import Foundation
import Moya
enum DeliveryService {
    case discoverFavorites(offset: Int16, page: Int16)
}
extension DeliveryService: TargetType {
    var baseURL: URL { return URL(string: BasePath.baseUrl)! }
    var path: String {
        switch self {
        case .discoverFavorites:
            return Path.countries
        }
    }
    var method: Moya.Method {
        switch self {
        case .discoverFavorites:
            return .get
        }
    }
    var sampleData: Data {
        switch self {
        case .discoverFavorites:
            guard let url = Bundle.main.url(forResource: "Delivery",
                                            withExtension: "json"),
                let data = try? Data(contentsOf: url) else { return Data() }
            return data
        }
    }
    var task: Task {
        switch self {
        case let .discoverFavorites(offset, page):
            return .requestParameters(parameters: ["offset": offset,
                                                   "limit": page],
                                      encoding: URLEncoding.queryString)
        }
    }
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
