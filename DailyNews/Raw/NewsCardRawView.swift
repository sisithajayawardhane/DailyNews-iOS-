//
//  NewsCardRawView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct NewsCardRawView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 380, height: 150)
    }
}

struct NewsCardRawView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardRawView()
    }
}
