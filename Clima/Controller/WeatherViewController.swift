//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
  
  // MARK: UI
  
  @IBOutlet weak var conditionImageView: UIImageView!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var searchTextField: UITextField!
  
  // MARK: Properties
  
  private var weatherManager = WeatherManager()
  
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.searchTextField.delegate = self
    self.weatherManager.delegate = self
  }
  
  @IBAction func searchWeather(_ sender: Any) {
    self.searchTextField.endEditing(true)
  }
  
}


extension WeatherViewController: UITextFieldDelegate{
  
  //리턴키를 눌렀을 때
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard self.searchTextField.text != "" else { return false } //"" 이기 때문에 리턴키 비허용
    return true //""가 아니기 때문에 리턴키 동작 허용
  }
  
  //사용자 입력이 끝날 때
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    guard self.searchTextField.text != "" else { return false }
    return true
  }
  
  //입력이 끝났을 때
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let cityName = self.searchTextField.text else { return }
    self.searchTextField.text = ""
    self.weatherManager.fecthWeather(cityName: cityName)
  }
}

// 프로토콜 채택시 extension으로
extension WeatherViewController: WeatherManagerDelegate {
  func updateWeather(weather: WeatherModel) {
    //쓰레드 전환
    DispatchQueue.main.async {
      self.conditionImageView.image = UIImage(systemName: weather.conditionName)
      self.temperatureLabel.text = weather.temperatureString
      self.cityLabel.text = weather.cityName
    }
  }
}

