//
//  PhotoMapViewController.swift
//  Instagram
//
//  Created by David King on 2/25/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ph: UIImage?
    var photo:UIImageView?
    
    let vcI = UIImagePickerController()
    
    //click what then try to open
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoButton(_ sender: AnyObject) {
        
        vcI.delegate = self
        vcI.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vcI.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vcI.sourceType = .photoLibrary
        }
        self.present(vcI, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as!UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        ph = editedImage
      
        
        performSegue(withIdentifier: "poster", sender: self)
        
        dismiss(animated: true, completion: nil)
        
        print("image choosen")
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let post = segue.destination as! PostViewController
        
        if let ph = ph
        {
            var g: String = "gad"
            post.image = ph
            
            print ("posted")
            
            
            
        }
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
