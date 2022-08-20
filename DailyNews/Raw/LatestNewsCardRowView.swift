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
                    .contrast(0.6)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: ui.y * 0.01) {
                Text("By " + author)
                    .foregroundColor(.white)
                    .font(.system(size: ui.x * 0.03))
                    .bold()
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: ui.x * 0.05))
                    .bold()
                Text(description)
                    .foregroundColor(.white)
                    .font(.system(size: ui.x * 0.03))
                    .bold()
                    
                    
            }
            .padding()
            
                
        }

        .frame(width: ui.x * 0.8, height: ui.y * 0.28)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct LatestNewsCardRowView_Previews: PreviewProvider {
    static var previews: some View {
        LatestNewsCardRowView(image_URL: "https://static.www.nfl.com/image/private/t_editorial_landscape_12_desktop/league/a7jryszhsvwphebof53d",
                              author: "Joel Corry",
                              title: "Agent's Take: The economic ramifications of Deshaun Watson's 11-game suspension - CBS Sports",
                              description: "None of Watson's $44.935 million signing bonus is in jeopardy due to language in his Browns contract")
            .previewDevice("iPhone 13 Pro Max")
        LatestNewsCardRowView(image_URL: "https://static.www.nfl.com/image/private/t_editorial_landscape_12_desktop/league/a7jryszhsvwphebof53d",
                              author: "Joel Corry",
                              title: "Agent's Take: The economic ramifications of Deshaun Watson's 11-game suspension - CBS Sports",
                              description: "None of Watson's $44.935 million signing bonus is in jeopardy due to language in his Browns contract")
            .previewDevice("iPhone 8")
        LatestNewsCardRowView(image_URL: "https://static.www.nfl.com/image/private/t_editorial_landscape_12_desktop/league/a7jryszhsvwphebof53d",
                              author: "Joel Corry",
                              title: "Agent's Take: The economic ramifications of Deshaun Watson's 11-game suspension - CBS Sports",
                              description: "None of Watson's $44.935 million signing bonus is in jeopardy due to language in his Browns contract")
            .previewDevice("iPod touch (7th generation)")
    }
}
