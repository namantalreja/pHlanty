//
//  WeatherService.swift
//  FINAL1
//
//  Created by Naman Talreja on 23/12/21.
//
import CoreLocation
import Foundation

public final class WeatherService: NSObject {
    
    private let locationManager = CLLocationManager()
    private let API_KEY = "623b5db9c3e8ff6c72b345d116adc95d"
    private var completionHandler: ((Weather) -> Void)?
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func loadWeatherData(_ completionHandler: @escaping((Weather) -> Void)){
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard error == nil, let data = data else { return }
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.completionHandler?(Weather(response: response))
                
            }
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate{
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
        
    ){
        guard let location = locations.first else{return}
        makeDataRequest(forCoordinates: location.coordinate)
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Something Went Wrong: \(error.localizedDescription)")
    }
}


struct APIMain: Decodable {
    let temp: Double
    let humidity: Double
}
struct APIResponse: Decodable{
    let name: String
    let main: APIMain
}
