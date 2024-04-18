//
//  ContentViewModel.swift
//  SocialProfile
//
//  Created by Pedro Marques on 18/04/24.
//

import Foundation

//ISSO É A VIEWMODEL ---
//Todo codigo que nao esta diretamente relacionado a construçao de uma interface, vem pra ca

//Para usar um @StateObject a estrutura deve ser em classe e nao struct, e ela deve ser marcada como ObservableObject

//Em struct com @State, qualquer mudança ocasiona no rerender da pagina. Agora com StateObject em classe precisamos indicar com @Published o que sera um gatilho de re-render para a view

class ContentViewModel: ObservableObject {
    
    @Published var isFollowing: Bool = false
    @Published var userFollowers = String()
    
    var user = User(name: "Pedro Marques",
                    nick: "@Pdro-marqss",
                    followers: 1436)
    
    init() {
        loadFollowers()
    }
    
    func loadFollowers() {
        self.userFollowers = formatNumber(value: user.followers)
    }
    
    func formatNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let formatedNumber = formatter.string(for: value) ?? "0"
        
        return "\(formatedNumber)K"
    }
    
    func followToogle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
