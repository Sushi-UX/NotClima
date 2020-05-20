//
//  ViewController.swift
//  NotClima
//
//  Created by Raymond Choy on 5/18/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import UIKit
                                            //>>>USING_CORELOCATION_TO_GET_LOCATION_DATA<<< STEP #J1. The first thing we must do is import Apples packet called CoreLocation
import CoreLocation


                                            //STEP #E8. Here in this class we must now adopt that "WeatherManagerDelegate"
                                            //>>>USING_EXTENSIONS_TO_REFACTOR<<< STEP #I1. Here we can see in our "WeatherViewController" class we are using quite a few delegates so let try to split them off into their own extensions to better organize our code.
//class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
                                            //STEP #I4. We can now delete the "UITextFieldDelegate," from here.
//class WeatherViewController: UIViewController, WeatherManagerDelegate {
                                            //STEP #I8. We can now delete the "WeatherManagerDelegate," from here.
class WeatherViewController: UIViewController {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
                                            //STEP #J2. CoreLocation comes with something called a "locationManager" so lets add it here as a constant from the CLLocationManager class. This will be responsible for getting the current GPS location of the users mobile phone.
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                                            //STEP #J3. Before we can use the "CLLocationManager" we should really first trigger a permission request as follows.
                                            //STEP #J4. Go into the Info.plist and add a new row at the top and select "Privacy - Location When In Use Usage Description" as the key and type "We need your location to get the current weather for where you are." as the Value
        locationManager.requestWhenInUseAuthorization()
        
                                            //STEP #E10. What we do have to do is to set this current class as the delegate.
                                            //STEP #E11. We have to say that the "weatherManager" dot "delegate" property is equal to "self". That way our WeatherManager's property is not nil.
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

//    @IBAction func searchPressed(_ sender: UIButton) {
//        searchTextField.endEditing(true)
//        print(searchTextField.text!)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            searchTextField.endEditing(true)
//            print(searchTextField.text!)
//            return true
//        }
//
//        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//            if textField.text != "" {
//                return true
//            } else {
//                textField.placeholder = "Type something"
//                return false
//            }
//        }
//
//        func textFieldDidEndEditing(_ textField: UITextField) {
//
//            if let city = searchTextField.text {
//                weatherManager.fetchWeather(cityName: city)
//            }
//
//            searchTextField.text = ""
//        }
        
                                    //STEP #D10. Here lets create another method called "didUpdateWeather".
                                    //STEP #E9. Here below you can see we are not getting an error because we already implemented a function called "didUpdateWeather" which satisfies our WeatherManagerDelegate.
                                    //STEP #F1. Lets modify our code to be more in line with how apple streamlines thier code.
                                    //STEP #F2. In our "didUpdateWeather" method, the first parameter input should really be the "weatherManager": which is of "WeatherManager" data type.
                                    //STEP #F3. You can notice in Apples method parameters they start thier parameters with an underscore. We can do the same in our parameters as well.
                                    //STEP #F4.Go to the WeatherManager for the next step...
//    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
                                    //STEP #D11. Inside lets, add the following print statement.
                                    //STEP #D12.For the next step, go back to the WeatherMagager
//        print(weather.temperature)
                                    //>>>UPDATING_THE_UI_BY_USING_THE_DISPATCHQUEUE<<< STEP #H1. Now that we are able to get a hold of the live weather data inside our didUpdateWeather method, lets try to use some of this data to set our user interface.
                                    //STEP #H2. The first thing we want to set is the "temperatureLabel" and if we just try setting it to equal "weather.temperatureString", it will just crash.
//        temperatureLabel.text = weather.temperatureString
                                    //STEP #H3. If you click on the error message question mark symbol it will basically say the reason it crashes is because we are trying to complete a task inside the Completion Handler. The Completion Handler is for long tasks only. These long running tasks should be handled in the background. So Apple tells us we need to wrap our task inside a dispatchQueue closure. Lets do that.
                                    //STEP #H4. Because its a closure we need to add the word "self." at the beginning.
//        DispatchQueue.main.async {
//            self.temperatureLabel.text = weather.temperatureString
                                    //STEP #H5. Now lets set the code for our weather condition symbol art as follows.
                                    //STEP #H6. Remeber to choose the "systemName" parameter input option with string as the data type and again add "self." at the beginning since we are still in a closure.
//            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
                                    //STEP #H7. To send the live city name info we can copy what was done with the temperature label.
//            self.cityLabel.text = weather.cityName
//
//        }
//    }
                                    //STEP #G7. Of course now that we are in the ViewController we must impliment our new didFailWithError function requirement as shown here.
//    func didFailWithError(error: Error) {
//        print(error)
//    }
    
}

//MARK: - UITextFieldDelegate
                                    //STEP #I2. First let create an "extension" for the "WeatherManagerDelegate" and this one will inherit from "UITextFieldDelegate".
extension WeatherViewController: UITextFieldDelegate {
                                    //STEP #I3. Inside lets copy and paste everything that deals with the UITextField including the IBAction.
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
}

//MARK: - WeatherManagerDelegate
                                //STEP #I5. Next we are going to create another extension for our "WeatherManagerDelegate".
                                //STEP #I6. Again lets start by creating another extension for our "WeatherViewController"
extension WeatherViewController: WeatherManagerDelegate {
                                //STEP #I7. Inside lets copy and paste everything that deals with the WeatherManager.
        func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {

            DispatchQueue.main.async {
                self.temperatureLabel.text = weather.temperatureString
                self.conditionImageView.image = UIImage(systemName: weather.conditionName)
                self.cityLabel.text = weather.cityName
            }
        }

        func didFailWithError(error: Error) {
            print(error)
        }
    
}

