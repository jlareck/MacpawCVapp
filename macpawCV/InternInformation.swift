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
    struct GeneralInformation:Decodable {
        var fullName: String
        var age: Int
        var email: String
        var mobilePhoneNumber: String
        
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
        var programmingLanguages: ProgrammingLanguages
        var others:Others
        struct ProgrammingLanguages:Decodable{
            var cpp:String
            var swift: String
        }
        struct Others:Decodable{
            var git:String
            var technologies:[String]
            var algorithms:String
        }
    }
    
}

