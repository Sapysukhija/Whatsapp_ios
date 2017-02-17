//
//  SecondViewController.swift
//  myWhtsapp
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import CoreData
import MobileCoreServices
import AVKit
import AVFoundation


class SecondViewController: UIViewController{
  
    @IBOutlet var tblView: UITableView!
    var selectedMenu:Int=0
        // var imagesArray = [UIImage]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func btnImgSend(_ sender: Any) {
            collectionView.isHidden=false
        }
    let urlsArray:[URL] = [URL(string:"https://pbs.twimg.com/profile_images/1501070030/John_2011_1_500x500.png")!,URL(string:"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSEZ7BeWjKs3f_zBbCpb4HWkajzsL-zP74g1YsijUAeCcAvxwrhVK1Jng")!]
    let menuButtonArray=["Image","Video"]
    var passedValue:String!
    var passedUrl:URL!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtView: UITextView!
    //@IBOutlet weak var btnSend: UIButton!
    //@IBOutlet weak var txtChat: UITextField!
    var myData:[String]!=[]
    @IBAction func BckBtnAction(_ sender: Any) {
        _=self.navigationController?.popViewController(animated: true)
    }
    let date = Date()
    let calendar = Calendar.current
    @IBAction func btnSave(_ sender: Any) {
        myData.append(txtView.text)
        myData.append(txtView.text)
        /* let appDelegate=(UIApplication.shared.delegate) as! AppDelegate
         let context = appDelegate.persistentContainer.viewContext
         let entity = NSEntityDescription.insertNewObject(forEntityName: "CHAT", into: context)
         entity.setValue(txtView.text, forKeyPath: "lbl1Chat")
         entity.setValue(txtView.text, forKeyPath: "lbl2Chat")
         //chatlabel.setValue(txtChat.text, forKey: "lbl1Chat")
         //chatlabel.setValue(txtChat.text, forKey: "lbl2Chat"*/
        for name in myData
        {
            print(name)
        }
         tblView.reloadData()
         txtView.text=""
       }
   
    override func viewDidLoad() {
    super.viewDidLoad()
    tblView.estimatedRowHeight = 48.0
    tblView.rowHeight = UITableViewAutomaticDimension
    btnSend.layer.cornerRadius=19
    lblName.text=passedValue
    myImg.kf.setImage(with: passedUrl)
    myImg.layer.cornerRadius=17.5
       
     
  //      let context = appDelegate.persistentContainer.viewContext*/
        // Do any additional setup after loading the view.
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SecondViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
      }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       /* let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomChat3rdell", for: indexPath) as! TableViewCell
        let imageView = cell.viewWithTag(8) as! UIImageView
        let item = imagesArray[indexPath.row]
        if item is UIImage
        {
            imageView.image = imagesArray[indexPath.row]
        }
        return cell*/

        if((indexPath.row%2)==0)
        {
        let cell=tableView.dequeueReusableCell(withIdentifier:"myCustomChat1stCell", for: indexPath) as! ChatIstTableViewCell
           cell.lblChatIst.layer.cornerRadius=10
            cell.lblChatIst.text=myData[indexPath.row]
            return cell
       }
        else if((indexPath.row%2)==1){
            
                let cell=tableView.dequeueReusableCell(withIdentifier:"myCustomChat2ndCell", for: indexPath) as! Chat2ndTableViewCell
                 cell.lblChat2nd.layer.cornerRadius=10
                 cell.lblChat2nd.text=myData[indexPath.row]
                    return cell
        }
        else
        {
                    return UITableViewCell()
        }
}}
extension SecondViewController:UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        collectionView.isHidden=true
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuButtonArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath)
        as! CollectionViewCellSecondViewControllerCollectionViewCell
        cell.myImgD.layer.cornerRadius=26.5
        cell.myImgD.kf.setImage(with: urlsArray[indexPath.item])
        cell.lblCollection.text=menuButtonArray[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMenu=indexPath.item
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        imgPicker.allowsEditing = true
        
        if(selectedMenu==indexPath.item)
        {
            imgPicker.mediaTypes = [( kUTTypeImage as String)]
            self.present(imgPicker, animated: true, completion: nil)
            
        }
        else
        {
            imgPicker.mediaTypes = [(kUTTypeMovie as String)]
            self.present(imgPicker, animated: true, completion: nil)
            
        }
        tblView.reloadData()
        
       
    }
    private func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        dismiss(animated:true, completion: nil) 
    }
}
