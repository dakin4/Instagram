//
//  IGViewController.swift
//  Instagram
//
//  Created by David King on 2/24/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class IGViewController: UIViewController , UITableViewDataSource{
    
    var posts: [PFObject] = []
    
    var caption: String = ""
    
    var count = 0
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        tableView.dataSource = self
        
        getPosts()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPosts(){
        
        if let query = ParsePost.query()
        {
            
            query.addDescendingOrder("createdAt")
            query.includeKey("author")
            query.limit = 20
            query.findObjectsInBackground(block:{ (post: [PFObject]?, error: Error?) -> Void in
                if let post = post{
                  
                 //  for n in 0..<pot.count {
                       // print("for value ", pot[n])
                    
                    
                    // the count printed below is 4
                    self.posts = post
                    //print("Posts.count",self.posts.count)
                    

                  //  }
                  
                   // print("count ", self.posts.count)
                        
                     //print("dave   ",  self.posts[1])
                   
                   // var e = p["author"]
                    
                   // var a: PFUser = e as! PFUser
                    
                    
                   // print("author   dave",a.username! )
                }
                else{
                    print(error)
                }
           
        })

        }
      
        //this count is 0
        var num = (self.posts.count)
             print("\n",num)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("table view function running")
        
        
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IGCell") as! IGTableViewCell
        
    print("Function to put")
        
    //let  posts = self.posts[indexPath.row]
     // print(posts)
     
        return cell
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
