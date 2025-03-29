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

    // 1. url 요청 생성
    let url = URL(string: "\(self.WeatherUrl)&q=\(cityName)")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // 2. Url Session 요청 전송
    let session = URLSession.shared
    
    // 3. Url Session Task 생성
    let task = session.dataTask(with: request) { (data, response, error) in
      
      if let error = error {
        print("에러 발생: \(error.localizedDescription)")
        return
      }
      
      // 서버 응답 상태 코드 확인
      if let httpResponse = response as? HTTPURLResponse {
        print("응답 코드: \(httpResponse.statusCode)")
      }
      
      // 4. Task 실행
      if let data = data {
        do {
          // 응답 데이터 파싱 (예: JSON)
          if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            print("응답 데이터: \(json)")
          }
        } catch {
          print("데이터 파싱 에러: \(error.localizedDescription)")
        }
      }
    }
    
    // 요청 시작
    task.resume()
  }
}
