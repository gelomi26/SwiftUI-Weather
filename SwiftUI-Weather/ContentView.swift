//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by KyoungSoo Kim on 6/8/24.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isNight = false
	
	var body: some View {
		ZStack {
			BackgroundView(isNight: $isNight)
			VStack {
				CityTextView(cityName: "Cupertino, CA")
				
				TodayWeatherView(todayWeather: isNight ? "moon.stars.fill" : "sun.max.fill",
												 temperature: 32)
				
				HStack(spacing: 20) {
					WeatherDayView(dayOfWeek: "TUE",
												 imageName: "cloud.sun.fill",
												 degreeOfDay: 27)
					
					WeatherDayView(dayOfWeek: "WED",
												 imageName: "cloud.heavyrain.fill",
												 degreeOfDay: 22);
					
					WeatherDayView(dayOfWeek: "THU",
												 imageName: "wind",
												 degreeOfDay: 24);
					
					WeatherDayView(dayOfWeek: "FRI",
												 imageName: "cloud.sun.bolt.fill",
												 degreeOfDay: 28);
					
					WeatherDayView(dayOfWeek: "SAT",
												 imageName: "snowflake",
												 degreeOfDay: 29);
				}
				Spacer()
				Button {
					isNight.toggle()
				} label: {
					WeatherButton(title: "Change Day Time",
												textColor: .black,
												backgroundColor: .white)
				}
				Spacer()
			}
		}
	}
}
#Preview {
    ContentView()
}

struct WeatherDayView: View {
	
	var dayOfWeek: String
	var imageName: String
	var degreeOfDay: Int
	
	var body: some View {
		VStack {
			Text(dayOfWeek)
				.font(.system(size: 20))
				.foregroundColor(.white)
			Image(systemName: imageName)
				.symbolRenderingMode(.multicolor)
				.resizable()
//				.foregroundStyle(.white, .pink, .blue)
				.aspectRatio(contentMode: .fit)
				.frame(width: 48, height: 48)
			Text("\(degreeOfDay)°")
				.font(.system(size: 28, weight: .medium, design: .default))
				.foregroundColor(.white)
		}
	}
}

struct BackgroundView: View {
//	var topColor: Color
//	var bottomColor: Color
	
	@Binding var isNight: Bool
	
	var body: some View {
//		LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//																							 isNight ? .gray : .lightblue]),
//									 startPoint: .topLeading,
//									 endPoint: .bottomTrailing)
//		.ignoresSafeArea()
		ContainerRelativeShape()
			.fill(isNight ? Color.black.gradient : Color.blue.gradient)
			.ignoresSafeArea()
	}
}



struct CityTextView: View {
	var cityName: String
	
	var body: some View {
		Text(cityName)
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundColor(.white)
			.padding(32)
	}
}

struct TodayWeatherView: View {
	var todayWeather: String
	var temperature: Int
	
	var body: some View {
		VStack(spacing: 12) {
			Image(systemName: todayWeather)
				.symbolRenderingMode(.multicolor)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 150, height: 150)
			
			Text("\(temperature)°C")
				.font(.system(size: 48, weight: .medium))
				.foregroundColor(.white)
		}
		.padding(.bottom, 40)
	}
}

