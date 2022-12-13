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
    
    @FocusState var fieldIsFocused: Bool
    
    let sliderTint: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(Color(.systemGray))
                .frame(width: 40, height: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(sliderTint)
            TextField("", text: $inputValue)
                .bordered()
                .multilineTextAlignment(.trailing)
                .frame(width: 65, height: 40)
                .keyboardType(.numberPad)
                .focused($fieldIsFocused)
        }
    }
}

//struct SliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderView(value: 10.0, inputValue: $inputValue, textColor: .red)
//    }
//}
