//
//  PersonDetailsViewController.swift
//  CybilltekExam
//
//  Created by milky.agora on 6/6/18.
//  Copyright © 2018 milky.agora. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var contactPerson: UILabel!
    @IBOutlet weak var contactPersonPhoneNumber: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        firstName.text = user.firstName
        lastName.text = user.lastName
        birthday.text = formatter.string(from: user.birthday as! Date)
        age.text = String(user.age)
        emailAddress.text = user.emailAddress
        mobileNumber.text = user.mobileNumber
        address.text = user.address
        contactPerson.text = user.contactPerson
        contactPersonPhoneNumber.text = user.contactPersonPhoneNumber
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
