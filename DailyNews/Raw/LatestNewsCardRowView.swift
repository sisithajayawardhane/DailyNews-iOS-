//
//  LatestNewsCardRowView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct LatestNewsCardRowView: View {
    let image_URL:String
    let author:String
    let title:String
    let description:String
    var body: some View {

        ZStack {
            AsyncImage(url: URL(string: image_URL)){ image in
                image.resizable()
                    .contrast(0.3)
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
                Text(description)
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
            }
            .padding()
            
                
        }

        .frame(width: 330, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct LatestNewsCardRowView_Previews: PreviewProvider {
    static var previews: some View {
        LatestNewsCardRowView(image_URL: "https://static.www.nfl.com/image/private/t_editorial_landscape_12_desktop/league/a7jryszhsvwphebof53d",
                              author: "Joel Corry",
                              title: "Agent's Take: The economic ramifications of Deshaun Watson's 11-game suspension - CBS Sports",
                              description: "None of Watson's $44.935 million signing bonus is in jeopardy due to language in his Browns contract")
    }
}
