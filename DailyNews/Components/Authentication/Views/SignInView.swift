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
    @AppStorage("username") var currentUserUsername:String?
    @AppStorage("password") var currentUserPassword:String?
    @AppStorage("signed_in") var currentUserSignedIn:Bool = false
    
    var body: some View {
        VStack {
            CustomInputRowView(textfieldName: "Username",
                               placeholderText: "username here",
                               text: $username)

            CustomInputRowView(textfieldName: "Password",
                               placeholderText: "password here",
                               isSecureField: true,
                               text: $password)
            
            Button {
                signIn()
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
        .navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension SignInView {
    func signIn(){
        if username == currentUserUsername && password == currentUserPassword {
            currentUserSignedIn = true
        }
    }
}
