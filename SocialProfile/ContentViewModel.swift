//
//  ContentViewModel.swift
//  SocialProfile
//
//  Created by Pedro Marques on 18/04/24.
//

import Foundation

//ISSO É A VIEWMODEL ---
//Todo codigo que nao esta diretamente relacionado a construçao de uma interface, vem pra ca
struct ContentViewModel {
    
    var isFollowing: Bool = false
    var userFollowers = String()
    
    var user = User(name: "Pedro Marques",
                    nick: "@Pdro-marqss",
                    followers: 22645)
    
    init() {
        loadFollowers()
    }
    
    mutating func loadFollowers() {
        self.userFollowers = formatNumber(value: user.followers)
    }
    
    func formatNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let formatedNumber = formatter.string(for: value) ?? "0"
        
        return "\(formatedNumber)K"
    }
    
    mutating func followToogle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
