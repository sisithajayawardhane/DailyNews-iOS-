//
//  DailyNewsApp.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

@main
struct DailyNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                //ContentView()
               // SearchView(api_url: "https://newsapi.org/v2/everything?q=general&apiKey=022af00f8c084728931fd7ae0ddeba8d")
//                NewsDetailView(description: "vdsadfghd", image_URL: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/JX7ZERRACYI63HHGNASTXUYYMQ.jpg&w=1440")
            }
        }
    }
}
