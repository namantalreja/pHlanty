//
//  Humidity.swift
//  FINAL1
//
//  Created by Naman Talreja on 23/12/21.
//

import Foundation
 
let apiKeyh = "INSERT OPEN WEATHER MAP API KEY"
 
let datah: Data? = """
{"coord":{"lon":-80,"lat":40.44},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"base":"stations","main":{"temp":41.5,"feels_like":36.81,"temp_min":37.4,"temp_max":45,"pressure":1021,"humidity":80},"visibility":16093,"wind":{"speed":3.04,"deg":79},"clouds":{"all":90},"dt":1585068301,"sys":{"type":1,"id":3510,"country":"US","sunrise":1585048554,"sunset":1585092969},"timezone":-14400,"id":5206379,"name":"Pittsburgh","cod":200}
""".data(using: .utf8)
 
struct Weatherh: Codable {
    var temp: Double?
    var humidity: Double?
}
 
struct WeatherMainh: Codable{
    let main: Weatherh
}
 
func decodeJSONDataHumid(JSONData: Data){
    do{
        let weatherData = try? JSONDecoder().decode(WeatherMain.self, from: JSONData)
        if let weatherData = weatherData{
            let weather = weatherData.main
            print(weather.humidity!)
           
        }
    }
    
}
func pullJSONDataH(urlh: URL?, forecast: Bool){
    let task = URLSession.shared.dataTask(with: urlh!) { data, response, error in
        if let error = error {
            print("Error : \(error.localizedDescription)")
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Error : HTTP Response Code Error")
            return
        }
        
        guard let data = data else {
            print("Error : No Response")
            return
        }
        
        if (!forecast){
            decodeJSONDataHumid(JSONData: data)
        } else {
        }
    }
    task.resume()
}
 
let cityh = ""
let urlh = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityh)&appid=\(apiKeyh)&units=imperial")
