//
//  SliderView.swift
//  Colorized SwiftUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @Binding var inputValue: String
    
    @State private var showAlert = false
    
    @FocusState var fieldIsFocused: Bool
    
    let sliderTint: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(Color(.systemGray))
                .frame(width: 40, height: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .onChange(of: value) { _ in
                    inputValue = "\(lround(value))"
                }
                .tint(sliderTint)
            TextFieldView(
                value: $value,
                inputValue: $inputValue,
                fieldIsFocused: _fieldIsFocused
            )
            .onAppear {
                inputValue = "\(lround(value))"
            }
        }
    }
}
