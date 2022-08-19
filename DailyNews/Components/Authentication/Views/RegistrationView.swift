//
//  RegistrationView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            Text("Daily News")
                .font(.title)
            CustomInputRowView(textfieldName: "Username",
                               placeholderText: "username here",
                               text: $username)
            
            CustomInputRowView(textfieldName: "Email",
                               placeholderText: "email here",
                               text: $email)

            CustomInputRowView(textfieldName: "Password",
                               placeholderText: "password here",
                               isSecureField: true,
                               text: $password)
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.red)
                    .clipShape(Capsule())
                    .padding()
            }
            
            Button {
                
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .foregroundColor(.red)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
