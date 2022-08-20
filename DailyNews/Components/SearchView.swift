//
//  SearchView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct SearchView: View {
    
    
    var category:String
    @State var text:String = ""
    @State var searchResultTest:String
    @State var filtetButtonClicked:Bool = false
    
    var body: some View {
        VStack {
            TextField("Search here", text: $text)
                .frame(width: 350, height: 20)
                .padding(15)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                .clipShape(Capsule())
            
            HStack {
                Button {
                   filtetButtonClicked = true
                } label: {
                    HStack {
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .background(Color("LightGray"))
                            .foregroundColor(.black)
                        Text("Filter")
                            .foregroundColor(.black)
                    }
                    .padding(15)
                    .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .clipShape(Capsule())
                    .padding(.leading)
                    
                }

                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10){ index in
                            Button {
                                
                            } label: {
                                Text(category)
                                    .frame(width: 100, height: 50)
                                    .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                                    .clipShape(Capsule())
                                    .foregroundColor(.black)
                            }

                            
                        }
                    }
                    .padding()
                }
            }
            
            Text(searchResultTest)
                .padding()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(0..<10){ index in
                        NewsCardRowView()
                    }
                }
            }
        }
        .sheet(isPresented: $filtetButtonClicked){
            FilterView()
        }
        .navigationBarHidden(true)
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(category: "health",
                   searchResultTest: "About 11,130,00 results for COVID New Variant")
    }
}

