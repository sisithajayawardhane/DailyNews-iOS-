//
//  NavBarButtonRowView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct NavBarButtonRowView: View {
    
    let imageSystemName:String
    let imageName:String
    
    var body: some View {
        VStack {
            Image(systemName: imageSystemName)
                .resizable()
                .scaledToFit()
                .frame(width: ui.x * 0.06, height: ui.x * 0.06)
            Text(imageName)
                .font(.system(size: ui.x * 0.03))
        }
        .foregroundColor(.gray)
    }
}

struct NavBarButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarButtonRowView(imageSystemName: "house", imageName: "Home")
    }
}
