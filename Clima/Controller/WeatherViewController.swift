//
//  ViewController.swift
//  NotClima
//
//  Created by Raymond Choy on 5/18/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import UIKit
                                            //STEP #E8. Here in this class we must now adopt that "WeatherManagerDelegate"
class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //STEP #E10. What we do have to do is to set this current class as the delegate.
        //STEP #E11. We have to say that the "weatherManager" dot "delegate" property is equal to "self". That way our WeatherManager's property is not nil.
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchTextField.endEditing(true)
            print(searchTextField.text!)
            return true
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            if textField.text != "" {
                return true
            } else {
                textField.placeholder = "Type something"
                return false
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if let city = searchTextField.text {
                weatherManager.fetchWeather(cityName: city)
            }
            
            searchTextField.text = ""
        }
        
                                    //STEP #D10. Here lets create another method called "didUpdateWeather".
                                    //STEP #E9. Here below you can see we are not getting an error because we already implemented a function called "didUpdateWeather" which satisfies our WeatherManagerDelegate.
    func didUpdateWeather(weather: WeatherModel) {
                                    //STEP #D11. Inside lets, add the following print statement.
                                    //STEP #D12.For the next step, go back to the WeatherMagager
        print(weather.temperature)
        
        }
    
    }

