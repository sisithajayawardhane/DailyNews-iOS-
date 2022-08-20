//
//  HomeView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn:Bool = false
    @State var latest_news_api_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var general_api_url =  "https://newsapi.org/v2/everything?q=general&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var health_api_url =  "https://newsapi.org/v2/everything?q=health&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var business_api_url =  "https://newsapi.org/v2/everything?q=business&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var science_api_url =  "https://newsapi.org/v2/everything?q=science&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var sports_api_url =  "https://newsapi.org/v2/everything?q=sports&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var technology_api_url =  "https://newsapi.org/v2/everything?q=technology&apiKey=022af00f8c084728931fd7ae0ddeba8d"
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
            
            VStack(spacing:25) {
                //search bar and notification button
                HStack {
                    NavigationLink {
                        SearchView(api_url: "https://newsapi.org/v2/everything?q=general&apiKey=022af00f8c084728931fd7ae0ddeba8d")
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
                            NavigationLink {
                                NewsDetailView(description: article.content ?? "", image_URL: article.urlToImage ?? "")
                            }label: {
                                LatestNewsCardRowView(image_URL: article.urlToImage ?? "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/JX7ZERRACYI63HHGNASTXUYYMQ.jpg&w=1440",
                                                      author: article.author ?? "unknown",
                                                      title: article.title!,
                                                      description: article.description ?? "Murillo Karam is the highest-ranking former official arrested in the investigation into the 43 Ayotzinapa students who disappeared in 2014.")
                            }
                            
                        }
                    }
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
                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(details_general.articles, id: \.self){ article in
                            NewsCardRowView(url: article.urlToImage ?? "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/JX7ZERRACYI63HHGNASTXUYYMQ.jpg&w=1440",
                                            author: article.author ?? "unknown",
                                            title: article.title!,
                                            date: article.publishedAt!)
                        }
                    }
                }

            }
            .padding()
            
            
            NavigationBarView()
        }
        .onAppear(perform: loadData)
        .onAppear(perform: loadData_general)
        .onAppear(perform: loadData_health)
        .onAppear(perform: loadData_business)
        .onAppear(perform: loadData_science)
        .onAppear(perform: loadData_sports)
        .onAppear(perform: loadData_technology)
        .navigationBarHidden(true)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
                        //print(response)

                        self.details = response
                    }
                    return
                }
            }
        }.resume()
    }
    func loadData_general() {

        guard let url = URL(string: general_api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        self.details_general = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    func loadData_health() {

        guard let url = URL(string: health_api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        self.details_health = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    func loadData_business() {

        guard let url = URL(string: business_api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        self.details_business = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    func loadData_science() {

        guard let url = URL(string: science_api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        self.details_science = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    func loadData_sports() {

        guard let url = URL(string: sports_api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        self.details_sports = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    func loadData_technology() {

        guard let url = URL(string: technology_api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        print(response)

                        self.details_technology = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    

}
