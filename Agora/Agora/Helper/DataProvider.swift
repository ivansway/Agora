//
//  DataProvider.swift
//  Agora
//
//  Created by Ivan Myrza on 05.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import Foundation
import UIKit

class DataProvider: NSObject, URLSessionDelegate {
    
    var imageCache = NSCache<NSString, UIImage>()
        
    func downloadImage(url: URL, completion: @escaping (UIImage) -> Void) {
        
        // FETCHING CACHED IMAGE
        if let chachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(chachedImage)
        
        } else {
            // DOWNLOAD IMAGE
            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data else {return}
                guard let image = UIImage(data: data) else {return}
                DispatchQueue.main.async {completion(image)}
                
                // CACHING IMAGE
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                
            }.resume()
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentDownloaded = totalBytesWritten / totalBytesExpectedToWrite
            
        // update the percentage label
        DispatchQueue.main.async {
            print("\(percentDownloaded * 100)%")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
}
