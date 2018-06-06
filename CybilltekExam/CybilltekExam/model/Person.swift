//
//  Person.swift
//  CybilltekExam
//
//  Created by milky.agora on 6/6/18.
//  Copyright © 2018 milky.agora. All rights reserved.
//

import Foundation

class Person: NSObject{
    var firstName = String()
    var lastName = String()
    var birthday = Date()
    var age = Int()
    var emailAddress = String()
    var mobileNumber = String()
    var address = String()
    var contactPerson = String()
    var contactPersonPhoneNumber = String()
    
    override init(){
        self.firstName = String()
        self.lastName = String()
        self.birthday = Date()
        self.age = Int()
        self.emailAddress = String()
        self.mobileNumber = String()
        self.address = String()
        self.contactPerson = String()
        self.contactPersonPhoneNumber = String()
    }
    
    
    init(firstName:String, lastName:String, birthday: Date, emailAddress: String, mobileNumber:String, address: String, contactPerson: String, contactPersonPhoneNumber: String ){
        let now = Date()
        let calendar = Calendar.current
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.age = (calendar.dateComponents([.year], from: birthday, to: now)).year!
        self.emailAddress = emailAddress
        self.mobileNumber = mobileNumber
        self.address = address
        self.contactPerson = contactPerson
        self.contactPersonPhoneNumber = contactPersonPhoneNumber
    }
}
