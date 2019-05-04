//
//  InternInformation.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/28/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

struct Description: Decodable{
    var generalInformation: GeneralInformation
    var education: Education
    var skills: Skills
    var accomplishments:[String]
}
struct GeneralInformation: Decodable {
    var fullName: String
    var age: Int
    var email: String
    var mobilePhoneNumber: String
    var imageURL: URL
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
    var school:String
    var highEducation:HighEducation
    struct HighEducation:Decodable {
        var university: String
        var faculty: String
        var specialty: String
        var other:String
    }
}
struct Skills:Decodable{
    var programmingLanguages:[String:String]
    var others:Others
    struct Others:Decodable{
        var git:String
        var technologies:[String]
        var algorithms:String
    }
}
