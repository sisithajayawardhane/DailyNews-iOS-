//
//  ContentView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct ui {
    static let x = UIScreen.main.bounds.width
    static let y = UIScreen.main.bounds.height
}

struct ContentView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn:Bool = false
    
    var body: some View {
        if currentUserSignedIn == true {
            HomeView()
        } else {
            SignInView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
