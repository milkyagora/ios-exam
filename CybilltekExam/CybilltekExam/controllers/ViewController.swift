//
//  ViewController.swift
//  CybilltekExam
//
//  Created by milky.agora on 6/6/18.
//  Copyright © 2018 milky.agora. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var personsTableView: UITableView!
    
    var persons = [Person]()
    var selectedUser = User()
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personsTableView.delegate = self
        personsTableView.dataSource = self
        personsTableView.register(UITableViewCell.self,
                                  forCellReuseIdentifier: "Cell")
        personsTableView.tableFooterView = UIView()
        fetchDataFromCoreData()
        if(users.count == 0){
            //representation of getting data from remote source
            loadMockData()
            
            for case let person in persons{
                saveDataToCoreData(person: person)
            }
            fetchDataFromCoreData()
        }
        
        personsTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveDataToCoreData(person: Person){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(person.firstName, forKey: "firstName")
        user.setValue(person.lastName, forKey: "lastName")
        user.setValue(person.birthday, forKey: "birthday")
        user.setValue(person.age, forKey: "age")
        user.setValue(person.emailAddress, forKey: "emailAddress")
        user.setValue(person.mobileNumber, forKey: "mobileNumber")
        user.setValue(person.address, forKey: "address")
        user.setValue(person.contactPerson, forKey: "contactPerson")
        user.setValue(person.contactPersonPhoneNumber, forKey: "contactPersonPhoneNumber")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchDataFromCoreData(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
            users = try managedContext.fetch(fetchRequest) as! [User]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = users[indexPath.row]
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "Cell",
                                          for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = "\(users[indexPath.row].firstName!) \(users[indexPath.row].lastName!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func loadMockData(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let person1 = Person(firstName: "Joy", lastName: "Reyes", birthday: formatter.date(from: "1994/03/21")!,  emailAddress: "joy.reyes@gmail.com", mobileNumber: "09126238467", address: "Culiat, Quezon City", contactPerson: "Mark Reyes", contactPersonPhoneNumber: "09175372954")
        let person2 = Person(firstName: "Vincent", lastName: "Ramos", birthday: formatter.date(from: "1990/11/11")!,  emailAddress: "vincent.ramos@gmail.com", mobileNumber: "09184528301", address: "Pembo, Makati City", contactPerson: "Juliano Ramos", contactPersonPhoneNumber: "091545200532")
        let person3 = Person(firstName: "Joshua", lastName: "Asoy", birthday: formatter.date(from: "1987/06/24")!,  emailAddress: "joshua.asoy@gmail.com", mobileNumber: "09159294311", address: "Bagong Bantay, Quezon City", contactPerson: "Roberto Asoy", contactPersonPhoneNumber: "091865539822")
        let person4 = Person(firstName: "David", lastName: "Baron", birthday: formatter.date(from: "1990/12/21")!,  emailAddress: "david.baron@gmail.com", mobileNumber: "09226738123", address: "Diliman, Quezon City", contactPerson: "Joshua Baron", contactPersonPhoneNumber: "09255381920")
        let person5 = Person(firstName: "Rowena", lastName: "Elisan", birthday: formatter.date(from: "1992/08/11")!,  emailAddress: "rowena.elisan@gmail.com", mobileNumber: "09176200213", address: "Batasan, Quezon City", contactPerson: "Rick Elisan", contactPersonPhoneNumber: "09157382121")
        persons.append(person1)
        persons.append(person2)
        persons.append(person3)
        persons.append(person4)
        persons.append(person5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetails"){
            let vc = segue.destination as! PersonDetailsViewController
            vc.user = selectedUser
        }
    }
    
}

