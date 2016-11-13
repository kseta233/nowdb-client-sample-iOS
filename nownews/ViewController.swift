//
//  ViewController.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var segmentedcontorl: UISegmentedControl!
    
    var arrNews = [NewsModel]()
    var selectedNews: Int = 0
    var filteredNews = [NewsModel]()
    
    //segue
    var segueToDetailNewsIdentifier = "NewsToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadFromAPI()
        // for table view initialitation
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == segueToDetailNewsIdentifier {
            let destinationVc = segue.destinationViewController as! DetailNewsViewController
            
            destinationVc.news = self.filteredNews[selectedNews]
        }
    }
    
    //API CALL
    func loadFromAPI() -> Void {
        API.selectAllApiCall { (result) -> Void in
            self.arrNews = result
            self.filteredNews = self.arrNews
        }
    }
    
    //MARK:- SEGMENTED CONTROL
    @IBAction func segmentedControlAction(sender: AnyObject) {
        switch segmentedcontorl.selectedSegmentIndex {
        case 0:
            //no filter
            self.filteredNews = self.arrNews
            
        case 1:
            //filter news sport only
            self.filteredNews = self.arrNews.filter{
                $0.category == constant.nowdb.collection.category.sport
            }
        case 2 :
            //filter news tech only
            self.filteredNews = self.arrNews.filter{
                $0.category == constant.nowdb.collection.category.tech
            }
            
        default:
            self.filteredNews = self.arrNews
        }
        
        self.tableview.reloadData()
    }
}

extension ViewController : BaseApp {
    func prepareUI(uiOptions: UIOptions) {
        self.segmentedcontorl.removeBorders()
    }
}

//MARK : - UITABLEVIEW DATA SOURCE EXTENSION
extension ViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNews.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "NewsCell"
        let cell = tableview.dequeueReusableCellWithIdentifier(identifier) as! NewsTableViewCell
        let object = filteredNews [indexPath.row]
        cell.initWithVar(object)
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedNews = indexPath.row
        self.performSegueWithIdentifier(segueToDetailNewsIdentifier, sender: self)
    }
}
//MARK: - UITABLEVIEW DELEGATE EXTENSION
extension ViewController : UITableViewDelegate {
   
    
}
