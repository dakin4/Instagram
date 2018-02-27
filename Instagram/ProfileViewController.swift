//
//  ProfileViewController.swift
//  Instagram
//
//  Created by David King on 2/25/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //do this when logout button clicked
    @IBAction func logoutAction(_ sender: AnyObject) {
        
       PFUser.logOut()
        
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
        
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
