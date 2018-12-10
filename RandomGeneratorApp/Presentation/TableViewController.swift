//
//  TableViewController.swift
//  CoreDataApp
//
//  Created by Konstantin Kalivod on 12/9/18.
//  Copyright © 2018 Kostya Kalivod. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UIGestureRecognizerDelegate{
    // MARK: - Variables and constants
    let queue = DispatchQueue(label: "com.multithreading")
    var mySortArray = MyModel.dataSampling(inputArray: MyModel.generatorRandomStrings(length: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        addRefreshControl()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return mySortArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        queue.async {
            cell.textLabel?.text = self.mySortArray[indexPath.row]
        }
//            tableView.reloadData()

        return cell
    }
    
    
    // MARK: - Reload table View
    func addRefreshControl() {
        
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.red
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
        mySortArray.append("NEW")
        refreshControl?.endRefreshing()
        self.tableView.reloadData()
        print("RELOADED")
    }

}
