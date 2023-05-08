//
//  ErrorConstants.swift
//  PremierLeagueFinally
//
//  Created by mac on 26/4/23.
//

import Foundation

enum Errors: String, Error {
    
    case unableToComplete = "Unable to complete request. Please check internet connection"
    case invalidPlayer =  "Sorry, we can't find this player"
    case networkCallError = "There weas a problem connecting the network, please try again"
    case unknownError = "Oops! Something went wrong, please try again"
}
