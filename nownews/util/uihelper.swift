//
//  uihelper.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class uihelper {
    static func loadImageFromUrl(url: String, view: UIImageView?){
        let placeHolder:UIImage = UIImage.init(named: "placeholder")!
        let nsUrl :NSURL = NSURL.init(string: url)!
        
        view?.sd_setImageWithURL(nsUrl, placeholderImage: placeHolder)
    }
}
