//
//  constant.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import Foundation
struct constant {
    
    struct API {
        static let domain_url: String = "http://io.nowdb.net"
        static let version: String = "v2"
        static let base_url: String = "\(domain_url)/\(version)"
        
        static let POST : String = "POST"
        static let GET : String = "GET"
        static let DELETE : String = "DELETE"
        static let PUT : String = "PUT"
    }
    
   
    struct nowdb {
        static let appid : String = "57cbdb091f6d04a35b26fb6b"
        static let token : String = "538d67698d909eca7dfb20a3"
        static let project : String = "nownews"
        
        struct collection {
//            static let todo : String = "todo"
            static let news : String = "news"
            
            struct category {
                static let sport: String = "sport"
                static let tech: String = "tech"
            }
        }
        
    }
}
