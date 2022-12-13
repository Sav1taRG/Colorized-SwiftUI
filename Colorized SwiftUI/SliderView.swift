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
    let textColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(textColor)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("", text: $inputValue)
        }
    }
}

//struct SliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderView(value: SliderView.value, textColor: .red)
//    }
//}
