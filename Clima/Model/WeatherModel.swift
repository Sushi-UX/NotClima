//
//  WeatherModel.swift
//  NotClima
//
//  Created by Raymond Choy on 5/18/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import Foundation

                        //STEP #C7. Lets create a struct named "WeatherModel".
struct Weathermodel {
                        //STEP #C8. Lets create 3 constant properties with data types as follows.
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
                        //STEP #C19. Lets create another computed property that will take the temperature and convert it to a Double with one decimal place.
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    
                        //STEP #C14. Instead of calling the WeatherId codes from this WeatherManager, we can instead create computed properties here to send to the WeatherManager.
                        //STEP #C15.Above we have our stored properties, and here lets declare a variable method named
    var conditionName: String {
                        //STEP #C16. Lets copy and paste the switch statement body from the getConditionName method into here instead.
                        //STEP #C17. Lets remember to change the name of what is being switched from "weatherId" to conditionId" instead.
                        //STEP #C18.Go back to the WeatherManager file for the next step...
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "snow"
        case 701-771:
            return "cloud.fog"
        case 781:
            return "tornado"
        case 801...804:
            return "cloud.sun"
        default:
            return "sun.max"
        }
    }
    
                        //STEP #C9.Go back to the WeatherManager file for the next step...
                        //STEP #C10. Paste the whole "getConditionName" method into the body of the "WeatherModel" struct.
                        //STEP #C11.Go back to the WeatherManager file for the next step...
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
