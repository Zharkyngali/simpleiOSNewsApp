//
//  ContentView.swift
//  newsApplication
//
//  Created by Zharkyngali Savanbay on 05.02.2021.
//  Copyright © 2021 Zharkyngali Savanbay. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url!)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(post.source.name!).foregroundColor(.red).fontWeight(.heavy).padding(.top, 20)
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(post.title!).fontWeight(.bold)
                                Text(post.description!).fontWeight(.light).lineLimit(2)
                            }
                            if post.urlToImage! != "" {
                                WebImage(url: URL(string: post.urlToImage!), options: .highPriority, context: nil)
                                    .resizable()
                                    .frame(width: 110, height: 135)
                                    .cornerRadius(20)
                            }
                        }.padding(.vertical, 15)
                    }
                }
            }
            .navigationBarTitle("BREAKING NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//post = [
//    Post(id: "1", title: "hello")
//    Post(id: "2", title: "hello")
//    Post(id: "3", title: "hello")
//]
