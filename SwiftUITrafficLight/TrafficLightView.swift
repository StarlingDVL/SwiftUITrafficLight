//
//  ContentView.swift
//  SwiftUITrafficLight
//
//  Created by Юрий Скворцов on 19.04.2022.
//

import SwiftUI

struct TrafficLightView: View {
    
    @State private var buttonTitle = "START"
    
    @State private var redLightIsOn = false
    @State private var yellowLightIsOn = false
    @State private var greenLightIsOn = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                trafficLight
                Spacer()
                Button(action: buttonPressed) {
                    setupButton
                }
            }
            .padding()
        }
    }
    
    private var trafficLight: some View {
        VStack(spacing: 20){
            CircleView(color: setTrafficLight(withHue: 0.03, isOn: redLightIsOn), opacity: redLightIsOn ? 1 : 0.5)
            CircleView(color: setTrafficLight(withHue: 0.14, isOn: yellowLightIsOn),opacity: yellowLightIsOn ? 1 : 0.5)
            CircleView(color: setTrafficLight(withHue: 0.3, isOn: greenLightIsOn), opacity: greenLightIsOn ? 1 : 0.5)
        }
    }
    
    private var setupButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 5)
                )
                .frame(width: 200, height: 70)
            Text("\(buttonTitle)")
                .foregroundColor(.white)
                .font(.title)
        }
    }
    
    private func buttonPressed() {
        buttonTitle = "NEXT"
        changeLight()
    }
    
    private func setTrafficLight(withHue hue: Double, isOn: Bool) -> Color {
        let color = !isOn
        ? Color(hue: hue, saturation: 1.0, brightness: 1.0)
        : Color(hue: hue, saturation: 1.0, brightness: 1.0)
        return color
    }
    
    private func changeLight() {
        let lightIsOn = true
        
        switch lightIsOn {
        case redLightIsOn:
            redLightIsOn = false
            yellowLightIsOn = true
        case yellowLightIsOn:
            yellowLightIsOn = false
            greenLightIsOn = true
        case greenLightIsOn:
            greenLightIsOn = false
            redLightIsOn = true
        default:
            redLightIsOn = true
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView()
    }
}
