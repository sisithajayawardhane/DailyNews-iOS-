//
//  ProfileView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn:Bool = false
    
    var body: some View {
        ZStack {
            Button {
                currentUserSignedIn = false
            } label: {
                Text("Log Out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.red)
                    .clipShape(Capsule())
                    .padding()
            }
            .navigationBarHidden(true)
            
            NavigationBarView()
        }
    }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
