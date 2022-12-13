//
//  ContentView.swift
//  Colorized SwiftUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderRedValue = Double.random(in: 0...255)
    @State private var sliderGreenValue = Double.random(in: 0...255)
    @State private var sliderBlueValue = Double.random(in: 0...255)
    
    @State private var redValueInput = ""
    @State private var greenValueInput = ""
    @State private var blueValueInput = ""
    
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        VStack {
            SliderView(value: $sliderRedValue,
                       inputValue: $redValueInput,
                       fieldIsFocused:_fieldIsFocused,
                       sliderTint: .red)
            SliderView(value: $sliderGreenValue,
                       inputValue: $greenValueInput,
                       fieldIsFocused: _fieldIsFocused,
                       sliderTint: .green)
            SliderView(value: $sliderBlueValue,
                       inputValue: $blueValueInput,
                       fieldIsFocused: _fieldIsFocused,
                       sliderTint: .blue)
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
                    .foregroundColor(Color(.systemGray))
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 2)
            .accentColor(Color(.systemGray))
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(
            content: self,
            modifier: BorderedViewModifier()
        )
    }
}
