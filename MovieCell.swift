//
//  MovieCell.swift
//  GrillaMovieApp
//
//  Created by Diego Ernesto MacbookAir  on 26/06/23.
//

import Foundation
import UIKit
import SDWebImage
import SDWebImageMapKit

class MovieCell : UICollectionViewCell{
    
    
    @IBOutlet weak var movieImage: UIImageView!
    
    func setImageUrl(_ url: String){
        let urlImage = "https://image.tmdb.org/t/p/w400\(url)"
        movieImage.sd_setImage(with: URL(string: "\(urlImage)"))
    }
}
