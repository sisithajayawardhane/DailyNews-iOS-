//
//  FilterView.swift
//  DailyNews
//
//  Created by mac on 2022-08-20.
//

import SwiftUI

struct FilterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("Filter")
                    .font(.title)
                    .bold()
                Spacer()
                HStack {
                    Image(systemName:"trash")
                        
                    Text("Reset")
                }
                .padding(10)
                .background(Color("LightGray"))
                //.background(Color(red: 0.9, green: 0.9, blue: 0.9))
                .clipShape(Capsule())
            }
            
            HStack {
                Text("Sort By")
                    .font(.title2)
                Spacer()
            }
            .padding()
            VStack {
                HStack {
                    Text("category")
                        .frame(width: 100, height: 50)
                        .background(Color("LightGray"))
                        .clipShape(Capsule())
                    Text("language")
                        .frame(width: 100, height: 50)
                        .background(Color("LightGray"))
                        .clipShape(Capsule())
                    Text("country")
                        .frame(width: 100, height: 50)
                        .background(Color("LightGray"))
                        .clipShape(Capsule())
                    
                }
                
            }
            Button {
                dismiss()
            } label: {
                Text("SAVE")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.red)
                    .clipShape(Capsule())
                    .padding()
            }
        }
        .frame(width: 400, height: 400)
        .clipShape(Rectangle())
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
