//
//  API.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation

class API {
    
    //MARK:- USED FOR GETTING ALL NEWS
    
    static let get_url : String = "\(constant.API.base_url)/select_all"
    static func generateGetUrl(
        collection: String)-> String{
        let result = "\(self.get_url)/token/\(constant.nowdb.token)/project/\(constant.nowdb.project)/collection/\(collection)/appid/\(constant.nowdb.appid)"
        
        return result
    }

    static func selectAllApiCall(onSuccessApiCall: [NewsModel] -> Void) {
        var arrNews = [NewsModel]()
        
        AFWrapper.request(constant.API.GET,
            strURL: API.generateGetUrl(constant.nowdb.collection.news),
                success: { (json) in
                    let jsonResult = json.arrayObject
                    
                    for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                        let id = anItem["id"] as! String
                        let title = anItem["title"] as! String
                        let description = anItem["description"] as! String
                        let imageUrl = anItem["image_url"] as! String
                        let category = anItem["category"] as! String
                        let date = anItem["date"] as! String
                        
                        let item : NewsModel = NewsModel.init(id: id, title: title, description: description, imageUrl: imageUrl, category: category, date: date)
                        arrNews.append(item)
                    }
                    onSuccessApiCall (arrNews)

        }) { (error) in
            
        }
    }
    
    
    static let insert_url : String = "\(constant.API.base_url)/insert"
    static func insert(news : NewsModel)-> [String:String]{
        
        let params: [String:String] = [
            "token" : constant.nowdb.token,
            "appid" : constant.nowdb.appid,
            "collection" : constant.nowdb.collection.news,
            "project" : constant.nowdb.project,
            "title": news.title,
            "date": news.date,
            "description": news.completeDescription,
            "image": news.imageUrl
        ]
        
        return params
    }
    
    
    
}