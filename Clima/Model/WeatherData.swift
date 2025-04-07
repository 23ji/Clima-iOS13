//
//  WeatherData.swift
//  Clima
//
//  Created by 이상지 on 4/6/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Decodable {
  let name: String
  let main: Main
  let weather: [Weather]
}

struct Main: Decodable {
  let temp: Float
}

struct Weather: Decodable {
  let id: Int
}
