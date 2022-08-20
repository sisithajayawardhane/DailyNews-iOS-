//
//  CustomInputRowView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct CustomInputRowView: View {
    
    let textfieldName: String
    let placeholderText: String
    var isSecureField:Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(textfieldName)
                .bold()
            
            if isSecureField ?? false {
                SecureField(placeholderText, text: $text )
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
            } else {
                TextField(placeholderText, text: $text )
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
            }
        }
        .padding(ui.x * 0.04)
    }
}

struct CustomInputRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputRowView(textfieldName: "Email", placeholderText: "Email here", text: .constant(""))
    }
}
