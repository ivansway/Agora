//
//  MainViewController.swift
//  Agora
//
//  Created by Ivan Myrza on 03.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let mainViewModel = MainViewModel()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MainCell.self, forCellReuseIdentifier: "MainCell")
        
        mainViewModel.fetchMainData { (mainElement) in
            self.mainViewModel.mainStorageElement = mainElement
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.mainStorageElement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.textLabel?.text = mainViewModel.mainStorageElement[indexPath.row].name
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainViewModel.pullDetailVC(navController: self.navigationController ?? UINavigationController(), screenIndex: indexPath.row)
    }
  
}
