//
//  DetalViewModel.swift
//  Agora
//
//  Created by Ivan Myrza on 04.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel {
    
    private let dataProvider = DataProvider()
    private let detailService = DetailService()
    var detailElement = [DetailElement]()

    public func fetchDetailData(screenIndex: Int, icon: @escaping (UIImage) -> Void, text: @escaping (String) -> Void) {
       
        detailService.fetchDetailData(urlPath: "/photos") { (detailElement) in
            self.detailElement = detailElement
            
            guard let url = URL(string: detailElement[screenIndex].url ?? "") else {return}
            
            
            self.dataProvider.downloadImage(url: url) { (image) in
                icon(image)
            }
            
            text(detailElement[screenIndex].title ?? "")
        }
    }
    
    private func downloadImage(url: URL, detailElement: [DetailElement], completion: @escaping (UIImage) -> Void) {
        
    }
}
