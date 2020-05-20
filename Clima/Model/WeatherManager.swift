//
//  WeatherManager.swift
//  NotClima
//
//  Created by Raymond Choy on 5/18/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

// VIDEO 088>>>UPDATING_THE_UI_BY_USING_THE_DISPATCHQUEUE<<< STEP #H1.
// Saved at begining of video 088 Updating the UI by Using the DispatchQueue.

import Foundation

                                                    //>>>PASS_DATA_TO_THE_VIEW_CONTROLLER_USING_A_PROTOCOL_FOR_A_DELEGATE<<< STEP #E3. By convention we create the protocol in the same file that will use the protocol.
                                                    //STEP #E4. Lets create a protocol with the same name as the variable delegate we declared below "WeatherManagerDelegate".
                                                    //STEP #E5. And the requirement of this protocol will be to the ability to perform the "didUpdateWeather" function.
                                                    //STEP #E6. The parameter inputs should be "weather" of data type Weathermodel

protocol WeatherManagerDelegate {
//    func didUpdateWeather(weather: WeatherModel)
                                                    //STEP #F4. Lets also impliment our adding of the underscore to start the parameter here as well.
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
                                                    //>>>ANOTHER_DELEGATE_TO_PASS_ERRORS<<< STEP #G1. Here we are going to create another delegate method now to be able to pass errors.
                                                    //STEP #G2. Let create another func called "didFailWithError"
                                                    //STEP #G3. The input parameter will be named "error" and that will be of data type "Error"
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=f878f193f23e2358e7daf2aa78783c4e&units=imperial"
    
                                                    //STEP #E2. To make a delegate work we would need a "WeatherManagerDelegate?" so whoever picks up this task must have the ability to perform the WeatherManagerDelegate task.
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
                                                    //STEP #B8. Replace this print statement with the following performRequest code.
//print(urlString)
                                                    //STEP #F9. In other places you will find that Apple likes to use proper grammer.
//        performRequest(urlString: urlString)
                                                    //STEP #F11. Here we can swap out the first parameter input name and replace it with the word "with".
        performRequest(with: urlString)
    }
    
//    func performRequest(urlString: String) {
                                                    //STEP #F10. Lets change this by adding the word "with" to start this parameter input name.
    func performRequest(with urlString: String) {
        
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
//                    print(error!)
                                                    //STEP #G4. A good place to use our new error delegate is here. Instead of printing the error, we can pass it to the delegate.
                                                    //STEP #G5. Because we are inside a closure we need to add "self."
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                                                    
                
                if let safeData = data {
                                                    //STEP #B6. Delete this declaration of dataString and this print statement.
//let dataString = String(data: safeData, encoding: .utf8)
//print(dataString)
                                                    //STEP #B9. Replace it with an actual parse of the JSONs(IKEA flat pack) values and data starting with the following self.parseJSON code...
                                                    //STEP #D2. Once we have created our weather model from our weather object, we want to be able to return it to our parseJSON.
                                                    //STEP #D3. Let add "let weather =" in front of "self.parseJSON
                                                    //STEP #D8. However we want to use this method so lets optional bind it by making it an "if let" statement.
                                                    //STEP #F6. The external parameter input name seem extranious here.
//                    if let weather = self.parseJSON(weatherData: safeData) {
                                                    //STEP #F8. It seems entirely possible to omit the weatherData parameter name as follows.
                if let weather = self.parseJSON(safeData) {
                        
                        
                                                    //WRONG STEP #D9. To be able to pass this data to the WeatherViewController object lets add code below. But this solution would make everything a one time use and disposable like a paper plate.
//                        let weatherVC = WeatherViewController()
//                        weatherVC.didUpdateWeather(weather: weather)
                                                    //CORRECT STEP #E1. To solve this problem using a delegate pattern instead.
                                                    //STEP #E7. Because this is calling data from a property inside the same method we must add "self." at the beginning
                                                    //STEP #E8.Go back to WeatherViewController for the next step...
//                        self.delegate?.didUpdateWeather(weather: weather)
                                                    //STEP #F5. Here where we are using the didUpdateWeather method you can see xcode is asking us to update our parameter names. Lets add "self" as our first parameter name.
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
                                                    //STEP #D10.Go back to WeatherViewController for the next step...
                                                    
                    }
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
                                        //STEP #D4. For #D3. to work we must create an output. Below let add an output to WeatherModel.
                                        //STEP #D8. But to "return nil" see #D7. we must make WeatherModel here an optional
//    func parseJSON(weatherData: Data) -> WeatherModel? {
                                        //STEP #F7. Add an underscore at the beginning of this parameter below.
   func parseJSON(_ weatherData: Data) -> WeatherModel? {
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
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                                        //STEP #D5. We could add "return weather" here but if this block doesn't run then there will be an error.
                return weather
//            print(getConditionName(weatherId: id))
                                        //STEP #C13. To print the condition name now we can change this as follows.
                                        //STEP #C14.Go back to the "Weathermodel" file for the next step...
//                print(weather.getConditionName(weatherId: id))
                
                                        //STEP #C18. Now if we want to get the weather condition we can shorten this print statement as follows,
                                        //STEP #C19.Go back to the "Weathermodel" file for the next step...
                                        //STEP #D6. Delete print statement below.
//                print(weather.temperatureString)
            } catch {
//                print(error)
                                        //STEP #G6. Another good place to use our new error delegate is here. Instead of printing the error, we can pass it to the delegate.
                                        //STEP #G7.Go to the "WeatherViewController" for the next step...
                delegate?.didFailWithError(error: error)
                                        //STEP #D7. We could return "nil" to get rid of this warning.
                return nil
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


    

