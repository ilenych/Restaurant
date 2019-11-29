//
//  NetworkService.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

struct MyKeys {
    static let imagesCollection = "imagesCollection"
    static let uid = "page"
    static let imageUrl = "imageUrl"
}

class NetworkService {
    
    static let shared = NetworkService()
    
    func downloadImage(menuPage: String, imageView: UIImageView, activityIndicator: UIActivityIndicatorView) {
        
        let query = Firestore.firestore().collection(MyKeys.imagesCollection).whereField(MyKeys.uid, isEqualTo: menuPage)
        query.getDocuments { (snapshot, err) in
            if let err = err {
                print("Don't get documents", err)
                return
            }
            guard let snapshot = snapshot,
                let data = snapshot.documents.first?.data(),
                let urlString = data[MyKeys.imageUrl] as? String,
                let url = URL(string: urlString) else {
                    print("Error, don't get snashot")
                    return
            }
            let resource = ImageResource(downloadURL: url)
            imageView.kf.setImage(with: resource) { (results) in
                switch results {
                case .success(_):
                    print("Succes download image")
                case .failure(let err):
                    print(err)
                }
            }
            activityIndicator.stopAnimating()
        }
    }
    
    // other way download image just from store
//    func straightFromStore() {
        
        //        let storeg = Storage.storage().reference().child("menu1.PNG")
        //        let donnwload = storeg.getData(maxSize: 500) { (data, err) in
        //            if let data = data {
        //                let image = UIImage(data: data)
        //                self.imageView.image = image
        //            }
        //        }
        //        donnwload.observe(.progress) { (snapshot) in
        //            print(snapshot.progress ?? "Error")
        //        }
        //        donnwload.resume()
//    }
    
    private init() {}
}
