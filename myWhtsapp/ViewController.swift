//
//  ViewController.swift
//  myWhtsapp
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import CoreData
import Kingfisher

class ViewController: UIViewController,CNContactPickerDelegate {
    var name:String!
    var urlPassed:URL!
    @IBOutlet weak var myMenuTableView: UITableView!
    @IBOutlet weak var myMainTable: UITableView!
    var selectedMenu:Int=0
    var myData = [
        [MyModel(lblName: "JOHN", lblMsg: "", url:URL(string: "https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!),
         MyModel(lblName: "KATE", lblMsg: "", url:URL(string: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQR_7jcGhl3zqDjA1-g3OEQ1oMWQ_xZZej3YET1u01ETXhQgErM-MgJ1T3N")!),
         MyModel(lblName: "ANNA", lblMsg: "", url:URL(string: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSEZ7BeWjKs3f_zBbCpb4HWkajzsL-zP74g1YsijUAeCcAvxwrhVK1Jng")!),
         MyModel(lblName: "Daniel", lblMsg: "", url:URL(string:"https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4NTExODc3Nl5BMl5BanBnXkFtZTgwODUyMDEzMDE@._V1_UY317_CR11,0,214,317_AL_.jpg")!),
         MyModel(lblName: "Davil", lblMsg: "", url:URL(string: "https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!),
         MyModel(lblName: "Hank", lblMsg: "", url:URL(string: "https://pbs.twimg.com/profile_images/532621351836606464/0P0PvVqX.jpeg")!),
         ],
        [MyModel(lblName: "JOHN", lblMsg: "hlo", url:URL(string: "https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!),
            MyModel(lblName: "KATE", lblMsg: "hws uhh", url:URL(string: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQR_7jcGhl3zqDjA1-g3OEQ1oMWQ_xZZej3YET1u01ETXhQgErM-MgJ1T3N")!),
            MyModel(lblName: "ANNA", lblMsg: "m fine", url:URL(string: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSEZ7BeWjKs3f_zBbCpb4HWkajzsL-zP74g1YsijUAeCcAvxwrhVK1Jng")!),
            MyModel(lblName: "Daniel", lblMsg: "wat about uhh", url:URL(string:"https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4NTExODc3Nl5BMl5BanBnXkFtZTgwODUyMDEzMDE@._V1_UY317_CR11,0,214,317_AL_.jpg")!),
            MyModel(lblName: "Davil", lblMsg: "wat u doing", url:URL(string: "https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!),
            MyModel(lblName: "Hank", lblMsg: "tell me", url:URL(string: "https://pbs.twimg.com/profile_images/532621351836606464/0P0PvVqX.jpeg")!),
            ]
    ]
    let urlsArray:[URL] = [URL(string:"https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!,URL(string:"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSEZ7BeWjKs3f_zBbCpb4HWkajzsL-zP74g1YsijUAeCcAvxwrhVK1Jng")!,URL(string:"https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!,URL(string:"https://pbs.twimg.com/profile_images/532621351836606464/0P0PvVqX.jpeg")!,URL(string:"https://pbs.twimg.com/profile_images/532621351836606464/0P0PvVqX.jpeg")!,URL(string:"https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!]
    
    let menuArray=["CALLS","CHATS","CONTACTS"]
    let menuButtonArray=["New Group","New Broadcast","WhatsApp Web","Starred msgs","Status","Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contacts: [CNContact] = {
            let contactStore = CNContactStore()
            let keysToFetch = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactEmailAddressesKey,
                CNContactPhoneNumbersKey,
                CNContactImageDataAvailableKey,
                CNContactThumbnailImageDataKey] as [Any]
            
            // Get all the containers
            var allContainers: [CNContainer] = []
            do {
                allContainers = try contactStore.containers(matching: nil)
            } catch {
                print("Error fetching containers")
            }
            
            var results: [CNContact] = []
            
            // Iterate all containers and append their contacts to our results array
            for container in allContainers {
                let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
                
                do {
                    let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                    results.append(contentsOf: containerResults)
                    //myContacts.append(contentsOf: containerResults)
                } catch {
                    print("Error fetching results for container")
                }
            }
             return results
            
        }()
        var myContacts:[MyModel] = []
        contacts.enumerated().forEach{ index,data in
            myContacts.append(
               MyModel(lblName: data.givenName, lblMsg: "" ,url:urlsArray[index])
            )
            
        }
        myData.append(myContacts)

        
        // Do any additional setup after loading the view, typically from a nib.
             //  let chat = NSEntityDescription.insertNewObject(forEntityName: "CHAT", into: context)
        
    }
    @IBAction func btnMenuClicked(_ sender: Any) {
      myMenuTableView.isHidden=false
    }
    
    /* func contactPicker(picker: CNContactPickerViewController, didSelectContacts contacts: [CNContact]){
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value 
                print("number is = \(phoneNumber)")
            }
        }}
    
    func contactPickerDidCancel(picker: CNContactPickerViewController){
        print("Cancel Contact Picker")
    }*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let  cell:ViewControllerCollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "myCustomCollectionCell", for: indexPath) as! ViewControllerCollectionViewCell
        cell.lblMenu.text=menuArray[indexPath.row]
        if(selectedMenu==indexPath.item){
             cell.lblMenu.font = UIFont.boldSystemFont(ofSize: 12)
            cell.myView.isHidden=false
        }
        else{
             cell.lblMenu.font = UIFont.boldSystemFont(ofSize: 12)
             cell.myView.isHidden=true
        }
       
        cell.lblMenu.sizeToFit()
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMenu=indexPath.item
        myMainTable.reloadData()
        collectionView.reloadData()
    }
 
}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myMenuTableView.isHidden=true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if(tableView==myMenuTableView)
        {
           count=menuButtonArray.count
        }
        else if(tableView==myMainTable)
        {
        count=myData[selectedMenu].count
        }
       return count!
    }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
     
        if(tableView==myMainTable){
         let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomTableCell", for: indexPath) as! ViewControllerTableViewCell
           
            cell.input=myData[selectedMenu][indexPath.row]
            cell.myImg.layer.cornerRadius = 25
            cell.myImg.layer.borderColor=UIColor.white.cgColor
            cell.myImg.layer.borderWidth=1
            return cell
        }
        else if(tableView==myMenuTableView)
        {
            tableView.separatorStyle = .none
            let cell = tableView.dequeueReusableCell(withIdentifier: "myMenuCustomTableCell", for: indexPath) as! ViewControllerTableViewMenuCellTableViewCell
            cell.lblMenuTableView.text=menuButtonArray[indexPath.row]
            return cell
        }
        else
        {
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as! ViewControllerTableViewCell
        name = currentCell.lblName.text
        urlPassed=currentCell.myImg.kf.webURL
        self.performSegue(withIdentifier: "cellClicked", sender: self)
        tableView.deselectRow(at: indexPath!, animated: true)
        //let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "secondviewController") as! SecondViewController
        //self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "cellClicked") {
           let viewController = segue.destination as! SecondViewController
            viewController.passedValue=name
            viewController.passedUrl=urlPassed
            // initialize new view controller and cast it as your view controller
            //var viewController = segue.destinationViewController as AnotherViewController
            // your new view controller should have property that will store passed value
            //viewController.passedValue = valueToPass
    }
    
    
}


}
