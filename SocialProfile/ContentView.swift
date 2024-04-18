//
//  ContentView.swift
//  SocialProfile
//
//  Created by Pedro Marques on 17/04/24.
//

import SwiftUI

// ISSO É A MODEL ---
struct User {
    var name: String
    var nick: String
    var followers: Double
}

//ISSO É A VIEWMODEL ---
//Todo codigo que nao esta diretamente relacionado a construçao de uma interface, vem pra ca
struct ContentViewModel {
    
    var user = User(name: "Pedro Marques",
                    nick: "@Pdro-marqss",
                    followers: 22645)
}


// ISSO É A VIEW ---
struct ContentView: View {
    
    @State private var isFollowing = false
    var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            //Image de perfil ---
            AsyncImage(url: URL(string: "https://github.com/Pdro-marqss.png")) { imageState in
                switch imageState {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(height: 200)
                        .padding(.bottom, 10)
                case .failure:
                    Image(systemName: "photo")
                default:
                    EmptyView()
                }
            }
            
            Text(viewModel.user.name)
                .font(.largeTitle)
                .bold()
            
            Text(viewModel.user.nick)
                .font(.title3)
                .foregroundStyle(.secondary)
            
            Text("\(viewModel.user.followers)K")
                .font(.system(size: 80, weight: .light))
                .padding(40)
            
            
            VStack {
                //Seguir ---
                Button(action: {
                    print("botao precionado")
                }) {
                    Label("Follow", systemImage: "person.fill.badge.plus")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 8))
                }
                
                //Enviar mensagem ---
                Button(action: {
                    print("botao precionado")
                }) {
                    Label("Enviar Mensagem", systemImage: "paperplane.fill")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .padding()
                        .background(buttonColor)
                        .clipShape(.rect(cornerRadius: 8))
                        .disabled(isFollowing)
                }
                
            }
            .padding()
            
            var buttonColor: Color {
                return isFollowing ? .blue : .gray
            }
        }
    }
}

#Preview {
    ContentView()
}
