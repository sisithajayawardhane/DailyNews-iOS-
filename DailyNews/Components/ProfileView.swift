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
                    .font(.system(size: ui.x * 0.04))
                    .foregroundColor(.white)
                    .frame(width: ui.x * 0.7, height: ui.y * 0.07)
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
