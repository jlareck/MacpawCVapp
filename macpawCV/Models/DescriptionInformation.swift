//
//  InternInformation.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/28/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

struct Description: Decodable{
    let generalInformation: GeneralInformation
    let education: Education
    let skills: Skills
    let accomplishments:[String]
}
struct GeneralInformation: Decodable {
    let fullName: String
    let age: Int
    let email: String
    let mobilePhoneNumber: String
    let imageURL: URL
    init(fullName: String, age: Int, email: String, mobilePhoneNumber: String, imageURL: URL) {
        self.fullName = fullName
        self.age = age
        self.email = email
        self.mobilePhoneNumber = mobilePhoneNumber
        self.imageURL = imageURL
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyKeys.self)
        let fullName: String = try container.decode(String.self, forKey: .fullName)
        let age: Int = try container.decode(Int.self, forKey: .age)
        let email: String = try container.decode(String.self, forKey: .email)
        let mobilePhoneNumber: String = try container.decode(String.self, forKey: .mobilePhoneNumber)
        let imageURL: URL = try container.decode(URL.self, forKey: .imageURL)
        self.init(fullName: fullName, age: age, email: email, mobilePhoneNumber: mobilePhoneNumber, imageURL: imageURL)
    }
    enum MyKeys: String, CodingKey{
        case fullName = "fullName"
        case age = "age"
        case email = "email"
        case mobilePhoneNumber = "mobilePhoneNumber"
        case imageURL = "imageURL"
    }
    
}
struct Education:Decodable {
    let school:String
    let highEducation:HighEducation
    struct HighEducation:Decodable {
        let university: String
        let faculty: String
        let specialty: String
        let other:String
    }
}
struct Skills:Decodable{
    let programmingLanguages:[String:String]
    let others:Others
    struct Others:Decodable{
        let git:String
        let technologies:[String]
        let algorithms:String
    }
}
