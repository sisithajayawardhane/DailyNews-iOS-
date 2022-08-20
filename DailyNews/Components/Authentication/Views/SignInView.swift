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
            Text("Daily News")
                .font(.system(size: ui.x * 0.08))
            
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
                    .font(.system(size: ui.x * 0.05))
                    .foregroundColor(.white)
                    .frame(width: ui.x * 0.8, height: ui.y * 0.07)
                    .background(.red)
                    .clipShape(Capsule())
                    .padding()
            }
            NavigationLink {
                RegistrationView()
            } label: {
                HStack {
                    Text("Don't you have an account?")
                        .font(.system(size: ui.x * 0.04))
                    
                    Text("Sign Up")
                        .font(.system(size: ui.x * 0.04))
                        .fontWeight(.semibold)
                }
            }
            .foregroundColor(.red)
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
