//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by KyoungSoo Kim on 6/8/24.
//

import SwiftUI

struct WeatherButton: View {
	
	var title: String
	var textColor: Color
	var backgroundColor: Color
	
	var body: some View {
		Text(title)
				.frame(width: 250, height: 50)
				.background(backgroundColor.gradient)
				.foregroundColor(textColor)
				.font(.system(size: 18, weight: .bold, design: .default))
				.cornerRadius(11)
		}
	}

struct WeatherButton_Preview: PreviewProvider {
	static var previews: some View {
		WeatherButton(title: "Test Title",
									textColor: .white,
									backgroundColor: .blue)
	}
}
