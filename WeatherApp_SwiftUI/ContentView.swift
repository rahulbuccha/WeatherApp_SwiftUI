//
//  ContentView.swift
//  WeatherApp_SwiftUI
//
//  Created by Admin on 31/07/22.
//

import SwiftUI

struct ContentView: View {
    
    //Creating State for binding with button to toggle
    @State private var isNight = false
    
    var body: some View {
    
        //MARK: overall for background color
        ZStack{
            BackgroundView(isNight: $isNight) //used Binding 
            
            //MARK: For Text at Top
            VStack{
                CityTextView(cityName: "California, CA")
                    
                
                //MARK: For cloud image and temp text
                MainWeatherStatus(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 24 : 76)
                
                //MARK: No. of days temp HStack under VStack
                HStack(spacing: 20){
                    WeatherDaysView(dayOfWeek: "Tue",
                                    imageName: "cloud.sun.fill",
                                    temperature: 74)
                    
                    WeatherDaysView(dayOfWeek: "Wed",
                                    imageName: "cloud.sun.bolt.fill",
                                    temperature: 48)
                    
                    WeatherDaysView(dayOfWeek: "Thru",
                                    imageName: "wind.snow",
                                    temperature: 25)
                    
                    WeatherDaysView(dayOfWeek: "Fri",
                                    imageName: "sunset.fill",
                                    temperature: 30)
                    
                    WeatherDaysView(dayOfWeek: "Sat",
                                    imageName: "snow",
                                    temperature: -27)
                    
                    
                }
                    Spacer()
                
                //MARK: Button
                Button{
                    isNight.toggle()
                } label: {
                    WheatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                        
                    
                }
                
                Spacer()
                
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: function for weatherDays
struct WeatherDaysView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.white)
            
            
        }
    }
}

//MARK: Background Color
struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient : Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint : .topLeading,
                       endPoint : .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


//MARK: CityTextName
struct CityTextView: View{
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


//MARK: Main Weather
struct MainWeatherStatus: View {
    
    var imageName : String
    var temperature : Int
    
    var body: some View {
        
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 60)
    }
}

