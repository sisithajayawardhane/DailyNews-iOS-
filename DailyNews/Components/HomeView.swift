//
//  HomeView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct HomeView: View {
    
    @State var category:String
    @AppStorage("signed_in") var currentUserSignedIn:Bool = false
    @State var latest_news_api_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var details = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
   
    var body: some View {
        ZStack {
            
            VStack(spacing:25) {
                //search bar and notification button
                HStack {
                    NavigationLink {
                        SearchView(category: "dummy", searchResultTest: "dummy")
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
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bell.badge")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(7)
                            .background(.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
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
                        ForEach(details.articles,id: \.self){ article in
                            LatestNewsCardRowView(image_URL: article.urlToImage!,
                                                  author: article.author ?? "unknown",
                                                  title: article.title!,
                                                  description: article.description!)
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10){ index in
                            Text(category)
                                .frame(width: 100, height: 50)
                                .background(Color("LightGray"))
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
            
            
            VStack {
                Spacer()
                HStack(spacing:50) {
                    Button {
                        
                    } label: {
                        NavBarButtonRowView(imageSystemName: "house", imageName: "Home")
                    }
                    
                    Button {
                        
                    } label: {
                        NavBarButtonRowView(imageSystemName: "suit.heart", imageName: "Favourite")
                    }
                    
                    NavigationLink {
                        ProfileView()
                    } label: {
                        NavBarButtonRowView(imageSystemName: "person.crop.circle", imageName: "profile")
                    }

                }
                .frame(width: 300, height: 80)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .clipShape(Capsule())
                .padding(.bottom,50)
            }
        }
        .onAppear(perform: loadData)
        .navigationBarHidden(true)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(category: "health")
    }
}

extension HomeView {
    
    func loadData() {

        guard let url = URL(string: latest_news_api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        print(response)

                        self.details = response
                    }
                    return
                }
            }
        }.resume()
    }
    

}
