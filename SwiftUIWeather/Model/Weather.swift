//
//  Weather.swift
//  SwiftUITest
//
//  Created by Icetusk on 22.09.2024.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
