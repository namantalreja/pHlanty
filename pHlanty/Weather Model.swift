//
//  Weather Model.swift
//  FINAL1
//
//  Created by Naman Talreja on 24/12/21.
//

import Foundation

public struct Weather {
    let city:String
    let temperature:String
    let humidity:String
    
    init (response: APIResponse){
        city = response.name
        temperature = "\(response.main.temp)"
        humidity = "\(response.main.humidity)"
        
    }
}
