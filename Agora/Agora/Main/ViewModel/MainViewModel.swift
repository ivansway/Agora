//
//  MainViewModel.swift
//  Agora
//
//  Created by Ivan Myrza on 03.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import Foundation
import UIKit

class MainViewModel {
    
    let mainService = MainService()
    var mainStorageElement = [MainStorageElement]()

    func fetchMainData(completion: @escaping ([MainStorageElement]) -> ()) {
        mainService.fetchMainData(urlPath: "/users") { (mainElement) in
            self.mainStorageElement = mainElement
            completion(mainElement)
        }
    }
    
    public func pullDetailVC(navController: UINavigationController, screenIndex: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.screenIndex = screenIndex
        navController.pushViewController(detailVC, animated: true)
    }
}
