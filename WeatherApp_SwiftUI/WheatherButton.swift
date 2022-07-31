//
//  WheatherButton.swift
//  WeatherApp_SwiftUI
//
//  Created by Admin on 31/07/22.
//

import SwiftUI

//MARK: Button configuration
struct WheatherButton : View{
    var title: String
    var textColor : Color
    var backgroundColor : Color
    
    var body: some View{
        Text(title)
            .frame(width: 300, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
