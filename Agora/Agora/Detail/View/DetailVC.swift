//
//  DetailVC.swift
//  Agora
//
//  Created by Ivan Myrza on 04.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    let detailViewModel = DetailViewModel()
    
    public var screenIndex = 0
    let userIcon = UIImageView()
    let userTitle = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        detailSetup()
    }
    
    private func detailSetup() {
        self.title = "Photos"
        
        detailViewModel.fetchDetailData(screenIndex: screenIndex, icon: { (image) in
            self.userIconSetup(image: image)
        }) { (title) in
            self.userTitleSetup(title: title)
        }

    }
    
    private func userIconSetup(image: UIImage) {
        userIcon.image = image
        view.addSubview(userIcon)
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        userIcon.widthAnchor.constraint(equalToConstant: 600).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: 600).isActive = true
    }
    
    private func userTitleSetup(title: String) {
        userTitle.text = title
        userTitle.textAlignment = .left
        userTitle.preferredMaxLayoutWidth = 280
        userTitle.lineBreakMode = .byWordWrapping
        userTitle.numberOfLines = 0
        userIcon.addSubview(userTitle)
        userTitle.translatesAutoresizingMaskIntoConstraints = false
        userTitle.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: -70).isActive = true
        userTitle.centerXAnchor.constraint(equalTo: userIcon.centerXAnchor).isActive = true
        userTitle.widthAnchor.constraint(equalToConstant: 280).isActive = true
        userTitle.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }


}
