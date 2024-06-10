//
//  WeatherViewModel.swift
//  FINAL1
//
//  Created by Naman Talreja on 24/12/21.
//

import Foundation
public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var humidity: String = "--"
    
    public let weatherService: WeatherService
    public init (weatherService: WeatherService){
        self.weatherService = weatherService
    }
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)"
                self.humidity = "\(weather.humidity)"
            }
            
        }
    }
}
