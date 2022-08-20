//
//  NewsDetailView.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

struct NewsDetailView: View {
    let description:String
    let image_URL:String
    @State var isDragging = false
    var drag: some Gesture {
            DragGesture()
            .onChanged { _ in withAnimation(.spring()) { self.isDragging = true } }
        }
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: image_URL)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(maxWidth: .infinity, maxHeight: 500)
                .ignoresSafeArea()
                Spacer()
            }
            ScrollView() {
                    Text(description)
                        .padding(25)

            }
            .frame(maxWidth:.infinity,maxHeight: 700)
            .background(Color.white)
            
            .padding(.top, isDragging ? 200: 400)
            .gesture(drag)
        }
        .ignoresSafeArea()
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(description: "lorem ipsom", image_URL: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/JX7ZERRACYI63HHGNASTXUYYMQ.jpg&w=1440")
    }
}
