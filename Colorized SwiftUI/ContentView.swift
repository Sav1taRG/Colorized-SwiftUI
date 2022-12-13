//
//  ContentView.swift
//  Colorized SwiftUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State var sliderRedValue = Double.random(in: 0...255)
    @State var sliderGreenValue = Double.random(in: 0...255)
    @State var sliderBlueValue = Double.random(in: 0...255)
    
    @State var redValueInput = ""
    @State var greenValueInput = ""
    @State var blueValueInput = ""
    
    var body: some View {
        VStack {
            SliderView(value: $sliderRedValue,
                       inputValue: $redValueInput,
                       textColor: .red, sliderTint: .red)
            SliderView(value: $sliderGreenValue,
                       inputValue: $greenValueInput,
                       textColor: .green, sliderTint: .green)
            SliderView(value: $sliderBlueValue,
                       inputValue: $blueValueInput,
                       textColor: .blue, sliderTint: .blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.black)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 2)
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}
