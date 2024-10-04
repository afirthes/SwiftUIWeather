//
//  WeatherClient.swift
//  SwiftUIWeather
//
//  Created by Icetusk on 04.10.2024.
//

import Foundation

enum WeatherClientError: Error {
    case errorFetchingWeather
}

struct WeatherClient {
    
    func fetchWeatherByLocation(_ location: Location) async throws -> Weather? {
        guard let url = ApiEndpoint.weatherByLatLon(location.lat, location.lon).url else { throw WeatherClientError.errorFetchingWeather }
        let (data, respnse) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(WeatherResponse.self, from: data).main
    }

}
