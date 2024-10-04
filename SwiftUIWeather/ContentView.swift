//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Icetusk on 04.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    @State var city: String = ""
    @State var weather: Weather?
    @State var isFetching: Bool = false
    
    func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.getLocationByCityName(city) else { return }
            weather = try await weatherClient.fetchWeatherByLocation(location)
        }  catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetching = true
                }
                .task(id: isFetching) {
                    await fetchWeather()
                    isFetching = false
                    city = ""
                }
            Spacer()
            if let temp = weather?.temp {
                Text("\(MeasurementFormatter.temperature(value: temp))")
                    .font(.system(size: 50))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
