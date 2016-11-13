//
//  DetailNewsViewController.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import UIKit

class DetailNewsViewController: UIViewController, BaseApp {

    @IBOutlet weak var NewsTitle: UILabel!
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var NewsDescription: UILabel!
    @IBOutlet weak var NewsDate: UILabel!
    
    @IBOutlet weak var scrollview: UIScrollView!
    var news : NewsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI(UIOptions())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareUI(uiOptions: UIOptions) {
        self.NewsTitle.text = news.title
        self.NewsDate.text = news.date
        self.NewsDescription.text = news.completeDescription
        uihelper.loadImageFromUrl(news.imageUrl, view: NewsImage)
        
        let height: CGFloat = 0 + UIScreen.mainScreen().bounds.size.height + 500
        
        self.scrollview.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, height);

    }
    
    
}

