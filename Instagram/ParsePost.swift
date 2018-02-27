//
//  ParsePost.swift
//  Instagram
//
//  Created by David King on 2/26/18.
//  Copyright © 2018 David King. All rights reserved.
//

import Foundation
import Parse

class ParsePost: PFObject, PFSubclassing{
    
    @NSManaged var media : PFFile
    
    @NSManaged var caption: String
    
   
   
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

    
    
    class func post(image: UIImage?, captn: String, completion: PFBooleanResultBlock? ) -> Void{
        let pos = ParsePost()
        if let image = image{
            
            pos.media = getPFFileFromImage(image: image)!
            
        }
        
        pos.caption = captn
        pos.saveInBackground(block: completion)
        
        
        print("parse psting bg")
        
        
        
    }
    
    
}
