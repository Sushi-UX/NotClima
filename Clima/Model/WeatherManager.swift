//
//  WeatherManager.swift
//  NotClima
//
//  Created by Raymond Choy on 5/18/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

// VIDEO 084>>>CREATE_WEATHERMODEL_AND_UNDERSTAND_COMPUTED_PROPERTIES<<< STEP #C1.
// Saved at begining of video 084 Create a WeatherModel and Understand Computed Properties.

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=f878f193f23e2358e7daf2aa78783c4e&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
//STEP #B8. Replace this print statement with the following performRequest code.
//print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
                                                    //>>>HOW_TO_CREATE_A_NETWORK_URL_SESSION<<< STEP #A1. Create a URL
        if let url = URL(string: urlString) {
                                                    //STEP #A2. Create a URLSession
            let session = URLSession(configuration: .default)
                                                    //STEP #A3. Give the session a task.
            
            
            
            
                                                    //>>>HOW_TO_CREATE_RECONFIGURE_NETWORK_URL_SESSION_TO_DECODE_JSON<<< STEP #B1. Delete the parameter completely and use XCode auto-complete to enter in the following new parameter...
                                                    //STEP #B2. Click return on the session parameter to turn it into a closure and type is as follows.
                                                    //STEP #B3. Change Data? to data, Change URL? to url, Change URLResponse? to response, Change Error? to error.
                                                    //STEP #B4. Copy and paste the body of what used to be our URLResponse to now be the code of this session.dataTask.
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                                                    //STEP #B6. Delete this declaration of dataString and this print statement.
//let dataString = String(data: safeData, encoding: .utf8)
//print(dataString)
                                                    //STEP #B9. Replace it with an actual parse of the JSONs(IKEA flat pack) values and data starting with the following self.parseJSON code...
                    self.parseJSON(weatherData: safeData)
                }
            }
                                                    //STEP #A4. Start the task
            task.resume()
        }
    }
    
//STEP #B5. Delete this whole method after it has been moved into the body of the session.dataTask
//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error!)
//            return
//        }
//
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }
   
    
                                        //STEP #B7. Create a new method called Parse JSON
    func parseJSON(weatherData: Data) {
                                        //STEP #B10. In the Model folder. Create a new Swift file and name it "WeatherData". Proceed to it for next steps.
                                        //STEP #B15.continued. Create a decoder
                                        //STEP #B16. Add the word "try"
        
// let decoder = JSONDecoder()
// try decoder.decode(WeatherData.self, from: weatherData)
                                        //STEP #B17. Wrap the line of code in a "do" block
        
// let decoder = JSONDecoder()
// do {
// try decoder.decode(WeatherData.self, from: weatherData)
// } catch {
// print(error)
                                        
            let decoder = JSONDecoder()
            do {
                                        //STEP #B18. decoder has an output so lets add "let decodedData =" in front of "try"
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                                        //STEP #B19. Now that we have "name" in a struct in a seperate file, we can try to print it in a print statement below.
                                        //STEP #B20.Go back to the WeatherData file...
                                        //STEP #B24. After "print(decodeData." swap in "main.temp)" and run the app
                                        //>>>CREATE_WEATHERMODEL_AND_UNDERSTAND_COMPUTED_PROPERTIES<<< STEP #C1.Go WeatherData file for next step...
                
                                        //STEP #C2. Lets use what we printed out to declare a constant named "id" and change the end dot notation from "description" to "id"...
                
                let id = decodedData.weather[0].id
                                        //STEP #C4. Create the following in a print statement to see if it prints the name of a corresponding weather symbol icon.
                                        //STEP #C11. Now that we have matched decodedDate for the weather dot id. Lets do the others.
                let temp = decodedData.main.temp
                let name = decodedData.name
                
                                        //STEP #C12. We can create a new weather object from our new weather model remember to provide internal names for the parameter.
                let weather = Weathermodel(conditionId: id, cityName: name, temperature: temp)
                
//            print(getConditionName(weatherId: id))
                                        //STEP #C13. To print the condition name now we can change this as follows.
                print(weather.getConditionName(weatherId: id))
            } catch {
                print(error)
        }
    }
                                        //STEP #C3. Create a method using a switch statement as the body to return a different icon for the different weather condition codes.
                                        //STEP #C5. Let reorganize this file to be more in accordance with the MVC design pattern.
                                        //STEP #C6. Create a new Swift file inside the "model" folder and lets name it "WeatherModel".
                                        //STEP #C7.Go to the "WeatherModel" file for the next step...
                                        //STEP #C9. Lets copy the whole "getConditionName" method and go back to the "weatherModel" file for the next step.
//    func getConditionName(weatherId: Int) -> String {
//        switch weatherId {
//        case 200...232:
//            return "cloud.bolt"
//        case 300...321:
//            return "cloud.drizzle"
//        case 500...531:
//            return "cloud.rain"
//        case 600...622:
//            return "snow"
//        case 701-771:
//            return "cloud.fog"
//        case 781:
//            return "tornado"
//        case 801...804:
//            return "cloud.sun"
//        default:
//            return "sun.max"
//        }
//    }
}


    

