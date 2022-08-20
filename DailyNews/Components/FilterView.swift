//
//  FilterView.swift
//  DailyNews
//
//  Created by mac on 2022-08-20.
//

import SwiftUI

struct modi:ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: ui.x * 0.25, height: ui.y * 0.05)
            .background(Color("LightGray"))
            .clipShape(Capsule())
            .font(.system(size: ui.x * 0.04))
    }
}

struct FilterView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isLanguageButtonClicked = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Filter")
                        .font(.system(size: ui.x * 0.08))
                        .bold()
                        
                }
                HStack {
                    Text("Sort By")
                        .font(.system(size: ui.x * 0.04))
                    
                }
                .padding()
                VStack {
                    HStack {
                        Text("category")
                            .modifier(modi())
                        Text("language")
                            .modifier(modi())
                            
                        Text("country")
                            .modifier(modi())
                        
                    }
                    
                }
                Button {
                    dismiss()
                } label: {
                    Text("SAVE")
                        .font(.system(size: ui.x * 0.04))
                        .foregroundColor(.white)
                        .frame(width: ui.x * 0.8, height: ui.y * 0.07)
                        .background(.red)
                        .clipShape(Capsule())
                        .padding()
                }
            }
            .clipShape(Rectangle())
        .padding()
        }
        
    }
    
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
