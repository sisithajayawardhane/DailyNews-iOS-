//
//  NavigationBarView.swift
//  DailyNews
//
//  Created by mac on 2022-08-20.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing:ui.y * 0.04) {
                NavigationLink {
                   HomeView()
                } label: {
                    NavBarButtonRowView(imageSystemName: "house", imageName: "Home")
                }
                Button {
                    
                } label: {
                    NavBarButtonRowView(imageSystemName: "suit.heart", imageName: "Favourite")
                }
                NavigationLink {
                    ProfileView()
                } label: {
                    NavBarButtonRowView(imageSystemName: "person.crop.circle", imageName: "profile")
                }

            }
            .frame(width: ui.x * 0.6, height: ui.y * 0.07)
            .padding(2)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            .clipShape(Capsule())
            .padding(.bottom,ui.y * 0.06)
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
