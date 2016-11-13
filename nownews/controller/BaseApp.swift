//
//  BaseApp.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation
import UIKit

protocol BaseApp {
    func presentError(errorOptions: ErrorOptions)
    
    func prepareUI(uiOptions: UIOptions)
    
    func generateAlert(myUIAlert: MyUIAlert)
}

//standart 
extension BaseApp where Self: UIViewController {
    func presentError( errorOptions : ErrorOptions = ErrorOptions() ) {
        //Add default implementation here and provide default values to your Error View.
    }
    
    func prepareUI(uiOptions: UIOptions){
        self.title = uiOptions.title
    }
    
    func generateAlert(myUIAlert: MyUIAlert = MyUIAlert() ){

        let alert = UIAlertController(title: myUIAlert.title, message: myUIAlert.message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("default")
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)    }

}