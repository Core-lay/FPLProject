//
//  Players.swift
//  PremierLeagueFinally
//
//  Created by mac on 24/4/23.
//

import Foundation

struct welcome: Codable {
 
   let elements: [Element]

   enum CodingKeys: String, CodingKey {
       case elements = "elements"
      
   }
}

// MARK: - Element

struct Element: Codable {
   
   let firstName: String
   let photo, secondName: String
   let goalsScored, assists: Int
   let yellowCards, redCards: Int
 
   
   enum CodingKeys: String, CodingKey {
       
       case firstName = "first_name"
       case photo = "photo"
       case secondName = "second_name"
       case goalsScored = "goals_scored"
       case assists = "assists"
       case yellowCards = "yellow_cards"
       case redCards = "red_cards"
   }
}
