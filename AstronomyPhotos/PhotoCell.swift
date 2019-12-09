//
//  PhotoCell.swift
//  AstronomyPhotos
//
//  Created by Oscar Victoria Gonzalez  on 12/9/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

@IBOutlet weak var planetImage: UIImageView!
    
    func configured(with urlString: String) {
        planetImage.setImage(with: urlString) { (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self.planetImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.planetImage.image = image
                }
                
            }
        }
    }

}
