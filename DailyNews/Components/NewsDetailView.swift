//
//  NewsDetailView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct NewsDetailView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("udara")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
