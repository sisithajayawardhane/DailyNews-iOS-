//
//  SearchView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct SearchView: View {
    
    
    //var category:String
    @State var text:String = ""
    @State var api_url:String
    @State var general_api_url =  "https://newsapi.org/v2/everything?q=general&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var filtetButtonClicked:Bool = false
    @State var details = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
    @State var details_general = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
    @State var details_health = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
    @State var details_business = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
    @State var details_science = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
    @State var details_sports = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
    @State var details_technology = APIStructure(
        totalResults: 0,
        articles: [article]()
    )
    
    var body: some View {
        ZStack {
            VStack {
                TextField("Search here", text: $text)
                    .textCase(.lowercase)
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
                            CategoryButtonView(category: "general")
                            CategoryButtonView(category: "health")
                                .onTapGesture {
                                    details_general = details_health
                                }
                            CategoryButtonView(category: "business")
                                .onTapGesture {
                                    details_general = details_business
                                }
                            CategoryButtonView(category: "science")
                                .onTapGesture {
                                    details_general = details_science
                                }
                            CategoryButtonView(category: "sports")
                                .onTapGesture {
                                    details_general = details_sports
                                }
                            CategoryButtonView(category: "technology")
                                .onTapGesture {
                                    details_general = details_technology
                                }
                        }
                        .padding()
                    }
                }
                
                Text("Loaded \(details_general.totalResults) results")
                    .padding()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(details_general.articles,id:\.self){ article in
                            NewsCardRowView(url: article.urlToImage ?? "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/JX7ZERRACYI63HHGNASTXUYYMQ.jpg&w=1440",
                                            author: article.author ?? "unknown",
                                            title: article.title!,
                                            date: article.publishedAt!)
                        }
                    }
                }
            }
            .sheet(isPresented: $filtetButtonClicked){
                FilterView()
            }
            .navigationBarHidden(true)
            .onAppear(perform: loadData_general)
            
            NavigationBarView()
            
        }
        
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(api_url: "https://newsapi.org/v2/everything?q=general&apiKey=022af00f8c084728931fd7ae0ddeba8d")
    }
}

extension SearchView {
    func search_key() -> String {
        if text.count == 0 {
           api_url = general_api_url
        }else {
            api_url = "https://newsapi.org/v2/everything?q=\(text)&apiKey=022af00f8c084728931fd7ae0ddeba8d"
        
        }
        return api_url
    }
    
    func loadData_general() {

        guard let url = URL(string:search_key()) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        //print(response)

                        self.details_general = response
                    }
                    return
                }
            }
        }.resume()
    }
}

