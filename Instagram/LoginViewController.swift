//
//  LoginViewController.swift
//  Instagram
//
//  Created by David King on 2/24/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBAction func onSignIn(_ sender: AnyObject) {
        
        let newUser = PFUser()
        
       let username = usernameField.text
       let password = passwordField.text
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) {(user: PFUser?, error: Error?) in
            if let error = error {
                
                print("user log in failed: \(error.localizedDescription)")
            }
            else {
                print("User logged in sucessfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
    }
 
    @IBAction func onSignUp(_ sender: AnyObject) {
        
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        
        newUser.password = passwordField.text
        
        
        
        newUser.signUpInBackground
            {(success: Bool, error: Error?) in
               if let error = error
               {
                
                print(error.localizedDescription)
                }
                
                else {
                    print("username success ")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
        
                }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
