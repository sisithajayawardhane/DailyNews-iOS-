//
//  HomeView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct HomeView: View {
    
    @State var cateogry:String
    
    var body: some View {
        ZStack {
            
            VStack(spacing:25) {
                //search bar and notification button
                HStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Dodgecoin to the Moon....")
                                
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .frame(width: 20)
                            
                                
                        }
                        .frame(width: 300, height: 40)
                        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                        .foregroundColor(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Image(systemName: "bell.badge")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(7)
                        .background(.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())

                }
                //latest news & see all
                HStack {
                    Text("Latest News")
                    Spacer()
                    Button {
                        
                    } label: {
                        HStack {
                            Text("See All")
                            Image(systemName: "arrow.right")
                        }
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10){ index in
                            LatestNewsCardRowView()
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10){ index in
                            Text(cateogry)
                                .frame(width: 100, height: 50)
                                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                                .clipShape(Capsule())
                        }
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(0..<10){ index in
                            NewsCardRowView()
                        }
                    }
                }
                

            }
            .padding()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(cateogry: "health")
    }
}
