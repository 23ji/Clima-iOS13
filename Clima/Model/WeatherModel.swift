//
//  WeatherModel.swift
//  Clima
//
//  Created by 이상지 on 4/6/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
  let conditionID: Int
  let cityName: String
  let temperature: Float
  
  var temperatureString: String {
    return String(format: "%.1f", self.temperature)
  }
  
  var conditionName: String {
    switch self.conditionID {
    case 200...232: return "cloud.bolt"
    case 300...321: return "cloud.drizzle"
    case 500...531: return "cloud.rain"
    case 600...622: return "cloud.snow"
    case 701...781: return "cloud.fog"
    case 800: return "sun.max"
    case 801...804: return "cloud.bolt"
    default: return "cloud"
    }
  }
}
