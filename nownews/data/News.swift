//
//  mNews.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewsModel : NSObject, BaseModel{
    var id: String = ""
    var title: String = ""
    var shortDescription: String = ""
    var completeDescription: String = ""
    var imageUrl: String = ""
    var category: String = ""
    var date: String = ""

    init(id: String, title: String, description: String, imageUrl: String, category: String, date: String) {
        super.init()
        self.id = id
        self.title = title
        self.shortDescription = description[description.startIndex.advancedBy(0)...description.startIndex.advancedBy(100)]
        self.completeDescription = description
        self.imageUrl = imageUrl
        self.date = date
        self.category = category
    }
    
    
    func initWithVar(json: JSON) -> Bool{
        var result: Bool = true
        
        if let id: String = json["id"].string{
            self.id = id
        }else{ result = false}
        
        if let date: String = json["date"].string{
            self.date = date
        }else{ result = false}
        
        if let title: String = json["title"].string{
            self.title = title
        }else{ result = false}
        
        if let imageUrl: String = json["image_url"].string{
            self.imageUrl = imageUrl
        }else{ result = false}
        
        if let category: String = json["category"].string{
            self.category = category
        }else{ result = false}
        
        if let shortDescription: String = json["description"].string{
            self.shortDescription = shortDescription[shortDescription.startIndex.advancedBy(0)...shortDescription.startIndex.advancedBy(100)]
        }else{ result = false}
        
        if let completeDescription: String = json["description"].string{
            self.completeDescription = completeDescription
        }else{ result = false}
        
        return result
    }
}