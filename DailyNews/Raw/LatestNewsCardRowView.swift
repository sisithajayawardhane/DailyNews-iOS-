//
//  LatestNewsCardRowView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct LatestNewsCardRowView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 350, height: 230)
    }
}

struct LatestNewsCardRowView_Previews: PreviewProvider {
    static var previews: some View {
        LatestNewsCardRowView()
    }
}
