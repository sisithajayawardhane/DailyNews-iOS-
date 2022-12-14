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
            .frame(width: ui.x * 0.3, height: ui.y * 0.06)
            .background(.red)
            .clipShape(Capsule())
            .foregroundColor(.white)
            .font(.system(size: ui.x * 0.05))
 
    }
}

struct CategoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonView(category: "health")
    }
}
