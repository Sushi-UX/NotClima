//
//  WeatherData.swift
//  NotClima
//
//  Created by Raymond Choy on 5/18/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import Foundation
                        //STEP #B11. Create a struct and name it WeatherData. This is where the data from the JSON will come back in.
                        //STEP #B12. Copy and paste the JSON url string into your web browser using Google JSON Awesome. Identify the property you want to first call and its type.
                        //STEP #B13. Declare the property in the struct below along with its type.
                        //STEP #B14. Then remember to make our struct inherit from its super class "Decodable".
                        //STEP #B15.Go back to your WeatherManager for the next step...
struct WeatherData: Decodable {
    let name: String
                        //STEP #B20.Go to the URL string and using JSON Awesome. Identify the next property you want to call and its type.
                        //STEP #B21. Looking at the URL string using JSON Awesome shows that "main" is an array of values so we need to create another struct below.
    let main: Main
    let weather: [Weather]
}

                        //STEP #B22. Lets create a struct and name it "Main" which also inherets from "Decodable".
struct Main: Decodable {
                        //STEP #B23. Add a property to this struct named temp matching the JSON name exactly and it is a type Double.
                        //STEP #B24.Go back to your WeatherManager for the next step...
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}

