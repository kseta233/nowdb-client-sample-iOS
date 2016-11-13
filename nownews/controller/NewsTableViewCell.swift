//
//  NewsTableViewCell.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell, BaseTVC{

    @IBOutlet weak var newsShortDescription: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImageUrl: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    
    func initWithVar(object: AnyObject) {
        let item = object as! NewsModel
        self.newsShortDescription.text = item.shortDescription
        self.newsDate.text = item.date
        self.newsTitle.text = item.title
        
        uihelper.loadImageFromUrl(item.imageUrl, view: self.newsImageUrl)
    }
}
