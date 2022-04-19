//
//  CircleView.swift
//  SwiftUITrafficLight
//
//  Created by Юрий Скворцов on 19.04.2022.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 130, height: 130)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red)
    }
}
