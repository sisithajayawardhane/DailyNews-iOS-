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
    
    @AppStorage("email") var currentUserEmail:String?
    @AppStorage("username") var currentUserUsername:String?
    @AppStorage("password") var currentUserPassword:String?
    @AppStorage("signed_in") var currentUserSignedIn:Bool = false
    
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
                signUp()
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.red)
                    .clipShape(Capsule())
                    .padding()
            }
            
            
            NavigationLink {
                SignInView()
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
extension RegistrationView {
    func signUp(){
        currentUserEmail = email
        currentUserPassword = password
        currentUserUsername = username
        currentUserSignedIn = true
        print(currentUserSignedIn)
    }
}


