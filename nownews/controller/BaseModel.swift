//
//  BaseModel.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol BaseModel {
    //selalu init dengan variable
    func initWithVar(json: JSON)->Bool
}

