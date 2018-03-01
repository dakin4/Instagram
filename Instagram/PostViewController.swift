//
//  ViewController.swift
//  Instagram
//
//  Created by David King on 2/21/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController{

  
    @IBOutlet weak var PostCaption: UITextField!
    
    @IBOutlet weak var PostImage: UIImageView!
    

    
    var image: UIImage?
    
    var capton: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let image = image{
            print ("print image")
            PostImage.image = image as UIImage
        }
        
        
    }
    
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 @IBAction func PostClicked(_ sender: AnyObject) {
    //I thought I had to create a class object to call a class method
    ParsePost.post(image: image, withCaption: PostCaption.text!) {( status: Bool, error: Error? ) in
        self.PostCaption.text = nil
        self.PostImage.image = nil
        
        self.performSegue(withIdentifier: "BackHome", sender: nil)
        
    }
    
    print("posting parse")
    
   // Not sure how to run my post method in pars as of now I am not able to
//pars.post(image: PostImage.image, String: PostCaption.text! )

    
    
    
    }
    
    
    
    
    
}

