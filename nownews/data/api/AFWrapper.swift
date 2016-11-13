//
//  AFWrapper.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class AFWrapper: NSObject {
    
    class func request(
        method : String = "GET",
        strURL : String = constant.API.base_url,
        message : String = "loading",
        params : [String : AnyObject]? = nil,
        headers : [String : String]? = nil,
        
        success:(JSON) -> Void,
        failure:(NSError) -> Void){
        
        SVProgressHUD.showWithStatus(message)
        
        var call : Alamofire.Method
        switch method {
        case constant.API.DELETE:
            call = Alamofire.Method.DELETE
        case constant.API.PUT:
            call = Alamofire.Method.PUT
        case constant.API.POST:
            call = Alamofire.Method.POST
        default:
            call = Alamofire.Method.GET
        }
        
        if method == constant.API.GET {
            Alamofire.request(.GET, strURL).responseJSON { (responseObject) -> Void in
                
                print("initiated in AFWrapper GET response obj from url \(strURL) \n param: \(strURL) \n response Object: \(responseObject)")
                
                if responseObject.result.isSuccess {
                    let resJson = JSON(responseObject.result.value!)
                    success(resJson)
                    SVProgressHUD.dismiss()
                }
                else {
                    let error : NSError = responseObject.result.error!
                    failure(error)
                    SVProgressHUD.showErrorWithStatus(error.localizedDescription)
                }
            }
        }
        else{
            //start alamofire call
            Alamofire.request(call, strURL, parameters: params, encoding: .URL , headers: headers).responseJSON { (responseObject) -> Void in
                print("initiated in AFWrapper POST response obj from url \(strURL) \n param: \(params) \n response Object: \(responseObject)")
                
                if responseObject.result.isSuccess {
                    let resJson = JSON(responseObject.result.value!)
                    success(resJson)
                    SVProgressHUD.dismiss()
                }
                else {
                    let error : NSError = responseObject.result.error!
                    failure(error)
                    SVProgressHUD.showErrorWithStatus(error.localizedDescription)
                }
            }
        }
        
    }
}