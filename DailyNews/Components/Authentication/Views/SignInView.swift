//
//  SignInView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct SignInView: View {
    
    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            CustomInputRowView(textfieldName: "EMAIL",
                               placeholderText: "email here",
                               text: $username)

            CustomInputRowView(textfieldName: "PASSWORD",
                               placeholderText: "password here",
                               isSecureField: true,
                               text: $password)
            
            Button {
                
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.red)
                    .clipShape(Capsule())
                    .padding()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
