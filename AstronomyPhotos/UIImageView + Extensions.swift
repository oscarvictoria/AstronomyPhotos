//
//  UIImageView + Extensions.swift
//  AstronomyPhotos
//
//  Created by Oscar Victoria Gonzalez  on 12/9/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

extension UIImageView {
    // instance method
    
    func getImage(with urlString: String,
                  completion: @escaping (Result<UIImage, AppError>) -> ()) {
        
        // configured UIActivityIndicatorView
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .orange
        activityIndicator.center = center // center of the UIImageView
        addSubview(activityIndicator) // this adds the view to the ImageView
        activityIndicator.startAnimating()
        NetworkHelper.shared.performDataTask(with: urlString) { [weak activityIndicator] (result) in
            
            DispatchQueue.main.async {
                activityIndicator?.stopAnimating()
            }
            switch result {
            case .failure(let appError):
                completion(.failure(AppError.networkClientError(appError)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
    }
}
