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
                Button(action: { buttonPressed() }) {
                    setupButton
                }
            }
            .padding()
        }
    }
    
    private var trafficLight: some View {
        VStack(spacing: 20){
            CircleView(color: setTrafficLight(withHue: 0.03, isOn: redLightIsOn))
            CircleView(color: setTrafficLight(withHue: 0.14, isOn: yellowLightIsOn))
            CircleView(color: setTrafficLight(withHue: 0.3, isOn: greenLightIsOn))
        }
    }
    
    private var setupButton: some View {
        ZStack {
            Color.white
            ZStack {
                Color.blue
                Text("\(buttonTitle)")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .frame(width: 190, height: 60)
            .cornerRadius(10)
        }
        .frame(width: 200, height: 70)
        .cornerRadius(10)
    }
    
    private func buttonPressed() {
        buttonTitle = "NEXT"
        changeLight()
    }
    
    private func setTrafficLight(withHue hue: Double, isOn: Bool) -> Color {
        var color: Color
        if isOn == false {
            color = Color(hue: hue, saturation: 1.0, brightness: 0.5)
        } else {
           color = Color(hue: hue, saturation: 1.0, brightness: 1.0)
        }
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
