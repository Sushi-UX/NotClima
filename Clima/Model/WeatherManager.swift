//
//  WeatherManager.swift
//  NotClima
//
//  Created by Raymond Choy on 5/18/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

// VIDEO 083>>>HOW_TO_CREATE_RECONFIGURE_NETWORK_URL_SESSION_TO_DECODE_JSON<<< STEP #B1.
// Might have saved at begining of video 081 Use the URLSession for networking.

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
                print(decodedData.weather[0].description)
            } catch {
                print(error)
        }
    }
}


    

