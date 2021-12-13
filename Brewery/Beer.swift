//
//  Beer.swift
//  Brewery
//
//  Created by David Yoon on 2021/12/13.
//

import UIKit


struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodPairing: [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashTags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: " #")
        }
        return hashTags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case brewersTips = "brewers_tips"
        case imageURL = "image_url"
        case foodPairing = "food_pairing"
    }
}
