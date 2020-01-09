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
    // Objective is to stop flickering while dequeue reusable cells
    // Solution: Keep track of the image url string by using a string variable on the cell
    
    override func prepareForReuse() {
         super.prepareForReuse()
         // empty out the image view
         planetImage.image = nil
     }
    
    private var urlString = ""
    
    func configured(with urlString: String) {
        self.urlString = urlString
        planetImage.getImage(with: urlString) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.planetImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    // Only if the cell's urlString is the same as the one being passed in from the cellForRowat
                    if self?.urlString == urlString {
                        self?.planetImage.image = image
                    }
                }
                
            }
        }
    }
    
 

}
