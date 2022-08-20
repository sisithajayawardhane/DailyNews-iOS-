//
//  CategoryButtonView.swift
//  DailyNews
//
//  Created by mac on 2022-08-20.
//

import SwiftUI

struct CategoryButtonView: View {
    let category:String
    var body: some View {
        Text(category)
            .frame(width: 100, height: 50)
            .background(.red)
            .clipShape(Capsule())
            .foregroundColor(.white)
 
    }
}

struct CategoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonView(category: "health")
    }
}
