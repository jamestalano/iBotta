//
//  OfferInformation.swift
//  IBottaProjet
//
//  Created by Mobile on 4/14/21.
//

import Foundation

// Implementation of Offer structure from JSON data.

struct Offer:Codable{
    let id : String
    let url : String?
    let name : String?
    let description : String?
    let terms : String?
    let current_value : String?
    var isFavorite : Bool?
}
