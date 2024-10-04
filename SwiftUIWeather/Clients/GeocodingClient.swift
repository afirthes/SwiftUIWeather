//
//  GeocodingClient.swift
//  SwiftUIWeather
//
//  Created by Icetusk on 04.10.2024.
//

import Foundation

enum GeocodingNetworkError: Error {
    case errorFetchingLocatoin
}

struct GeocodingClient {
    
    func getLocationByCityName(_ city: String) async throws -> Location? {
        guard let url = ApiEndpoint.coordinatesByLocation(city).url else { return nil }
        let (data, request) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Location].self, from: data).first
    }

}
