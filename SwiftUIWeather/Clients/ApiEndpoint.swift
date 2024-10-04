//
//  ApiEndpoint.swift
//  SwiftUIWeather
//
//  Created by Icetusk on 04.10.2024.
//

import Foundation

enum ApiEndpoint {
    
    static var baseURL: String = "https://api.openweathermap.org/"
    
    case coordinatesByLocation(String)
    case weatherByLatLon(Double, Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocation(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherAPIKey)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.weatherAPIKey)"
        }
    }
    
    var url: URL? {
        return URL(string: ApiEndpoint.baseURL + self.path)
    }
}
