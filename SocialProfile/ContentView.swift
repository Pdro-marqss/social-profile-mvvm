//
//  ContentView.swift
//  SocialProfile
//
//  Created by Pedro Marques on 17/04/24.
//

//COMPOSING VIEWS - Separar a view em componentes (igual no react)

import SwiftUI


// ISSO É A VIEW ---
struct ContentView: View {
    
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            ProfileDataView(viewModel: $viewModel)
            ActionView(viewModel: $viewModel)
        }
    }
}

struct ProfileDataView: View {
    
    @Binding var viewModel: ContentViewModel
    
    var body: some View {
        //Perfil ---
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
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(40)
    }
}

struct ActionView: View {
    
    @Binding var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            //Seguir ---
            Button(action: {
                viewModel.followToogle()
            }) {
                Label(!viewModel.isFollowing ? "Follow" : "Unfollow", systemImage: "person.fill.badge.plus")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
//                        .foregroundStyle(.white)
//                        .padding()
//                        .background(.blue)
//                        .clipShape(.rect(cornerRadius: 8))
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .indigo)
            
            //Enviar mensagem ---
            Button(action: {
                print("botao precionado")
            }) {
                Label("Enviar Mensagem", systemImage: "paperplane.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
//                        .foregroundStyle(.white)
//                        .padding()
//                        .background(buttonColor)
//                        .clipShape(.rect(cornerRadius: 8))
                    
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
