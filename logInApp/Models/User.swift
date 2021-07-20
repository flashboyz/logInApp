//
//  Model.swift
//  logInApp
//
//  Created by Константин Прокофьев on 19.07.2021.
//

import Foundation


struct User {
    let userName: String
    let userPassword: String
    let person: Person
    
    static func getUserData() -> User {
        User(
             userName: "Konstantin",
             userPassword: "Instructor",
             person: Person.getPerson()
        )
    }
}


struct Person {
    let firstName: String
    let secondName: String
    let image: String
    
    var fullName: String {
        "\(firstName) \(secondName)"
    }
    
    static func getPerson() -> Person {
        Person(firstName: "Konstantin", secondName: "Prokofiev", image: "Windsurfing")
    }
}

