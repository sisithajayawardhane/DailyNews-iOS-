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
    @State var optional_url = "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/JX7ZERRACYI63HHGNASTXUYYMQ.jpg&w=1440"
    static let base_url = "https://newsapi.org/v2/everything?q="
    static let api_key = "&apiKey=022af00f8c084728931fd7ae0ddeba8d"
    @State var general_api_url =  "\(base_url)general\(api_key)"
    @State var health_api_url =  "\(base_url)health\(api_key)"
    @State var business_api_url = "\(base_url)business\(api_key)"
    @State var science_api_url = "\(base_url)science\(api_key)"
    @State var sports_api_url = "\(base_url)sports\(api_key)"
    @State var technology_api_url = "\(base_url)technology\(api_key)"
    
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
            
            VStack(spacing:ui.y * 0.04) {
                //search bar and notification button
                HStack {
                    NavigationLink {
                        SearchView(api_url: general_api_url)
                    } label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search here")
                        }
                        .foregroundColor(.gray)
                        .font(.system(size: ui.x * 0.04))
                        .padding()
                        .frame(width:ui.x * 0.7)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 0)
                        )
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
                        ForEach(details.articles,id: \.self){ article in
                            NavigationLink {
                                NewsDetailView(description: article.content ?? "", image_URL: article.urlToImage ?? "")
                            }label: {
                                LatestNewsCardRowView(image_URL: article.urlToImage ?? optional_url,
                                                      author: article.author ?? "unknown",
                                                      title: article.title!,
                                                      description: article.description ?? "")
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
        .onAppear(perform: {
            loadData()
            loadData_general()
            loadData_health()
            loadData_business()
            loadData_science()
            loadData_sports()
            loadData_technology()
        })
        .navigationBarHidden(true)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    func loadDataDefault(url:String,details:APIStructure){
        guard let url = URL(string: url) else {
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
