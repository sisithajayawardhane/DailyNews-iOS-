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
                .frame(width: 30, height: 30)
            Text(imageName)
                .font(.caption)
        }
        .foregroundColor(.gray)
    }
}

struct NavBarButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarButtonRowView(imageSystemName: "", imageName: "")
    }
}
