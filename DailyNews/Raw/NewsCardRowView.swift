//
//  NewsCardRowView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct NewsCardRowView: View {
    let url:String
    let author:String
    let title:String
    let date:String
    
    var body: some View {

        ZStack {
            AsyncImage(url: URL(string: url)){ image in
                image.resizable()
                    .contrast(0.6)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("By " + author)
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
                Text(title)
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                Text(date)
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
            }
            .padding()
        }
        .frame(width: 380, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

struct NewsCardRawView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardRowView(
            url: "https://static.www.nfl.com/image/private/t_editorial_landscape_12_desktop/league/a7jryszhsvwphebof53d",
            author: "Joel Corry",
            title: "Agent's Take: The economic ramifications of Deshaun Watson's 11-game suspension - CBS Sports",
            date: "2022-08-04T12:30:00Z")
    }
}
