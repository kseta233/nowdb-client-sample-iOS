//
//  BaseModel.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation
import UIKit

struct Color {
    let red: Double
    let green: Double
    let blue: Double
    
    init(red: Double = 0.0, green: Double = 0.0, blue: Double = 0.0) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

struct ErrorOptions {
    let message: String
    let showArrow: Bool
    let backgroundColor: Color
    let size: CGSize
    let canDismissByTap: Bool
    
    init(message: String = "Error!", shouldShowArrow: Bool = true, backgroundColor: Color = Color(), size: CGSize = CGSizeZero, canDismissByTappingAnywhere canDismiss: Bool = true) {
        self.message = message
        self.showArrow = shouldShowArrow
        self.backgroundColor = backgroundColor
        self.size = size
        self.canDismissByTap = canDismiss
    }
    
    static func doSomething(){
        print("do somehitng")
    }
}


struct UIOptions{
    let title: String
    let backgroundColor: UIColor

    init (title: String = "NowNews", backgroundColor: UIColor = UIColor.whiteColor() ){
        self.title = title
        self.backgroundColor = backgroundColor
    }
}

struct MyUIAlert{
    let title: String
    let message: String
    
    init (title: String = "NowNews", message: String = "oOps ... something went wrong" ){
        self.title = title
        self.message = message
    }
}
