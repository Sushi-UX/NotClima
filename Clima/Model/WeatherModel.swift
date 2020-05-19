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
    
                        //STEP #C9.Go back to the WeatherManager file for the next step...
                        //STEP #C10. Paste the whole "getConditionName" method into the body of the "WeatherModel" struct.
                        //STEP #C11.Go back to the WeatherManager file for the next step...
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
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
}
