//
//  ContentView.swift
//  SocialProfile
//
//  Created by Pedro Marques on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://github.com/Pdro-marqss.png")) { imageState in
                switch imageState {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(height: 180)
                case .failure:
                    Image(systemName: "photo")
                default:
                    EmptyView()
                }
            }
            Text("Pedro Marques")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
