//
//  ParsePost.swift
//  Instagram
//
//  Created by David King on 2/26/18.
//  Copyright © 2018 David King. All rights reserved.
//

import Foundation
import Parse
// is this supposed to be an objective C file

class ParsePost: PFObject, PFSubclassing{
    
    @NSManaged var media : PFFile
    
    @NSManaged var caption: String
    
    @NSManaged var author: PFUser
    
    @NSManaged var likesCount: Int
    
 //   @NSManaged var commentsCount: Int
    
    // coujld also comment out the NSManaged var and write the decleration of these things as such in the post functino
    // post["media] = getPFFileFromImage(image:image)
    
    //this must be getting run by the database since it is never called in my code
     class func parseClassName() -> String {
        return "ParsePost"
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile?
    {
        if let image = image
        {
            if let imageData = UIImagePNGRepresentation(image)
            {
                return PFFile(name: "image.png", data: imageData)!
                
                
            }
        }
     return nil
    }

    
    //what does withCaption mean, why are the arguements in this format
    //what is a BooleanResultBlock
    class func post(image: UIImage?, withCaption caption: String, withCompletion completion: PFBooleanResultBlock? ) -> Void{
        
       // let post = PFObject(className: "poster")
        
       let post = ParsePost()
        // is inputed into database as image under the media key 
        //ie a array with keys
       post.media = getPFFileFromImage(image: image)!
    
        post.caption = caption
        
        post.author = PFUser.current()!
        
        
        
        post.saveInBackground(block: completion)
        
        
        
        print("parse psting bg")
        
        
        
    }
    
    
}
