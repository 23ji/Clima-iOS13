//
//  WeatherManager.swift
//  Clima
//
//  Created by 이상지 on 3/29/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
  let WeatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=ab2d2e496ebfc6758d71dd007225e58c"
  
  func fecthWeather(cityName: String) {
    let urlString = "\(WeatherUrl)&q=\(cityName)"
//    1.url
//    2. urlSession
//    3. urlSessionTask
//    4. task 실행
  }
}
