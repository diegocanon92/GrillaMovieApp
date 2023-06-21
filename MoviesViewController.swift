//
//  ViewController.swift
//  GrillaMovieApp
//
//  Created by Diego Ernesto MacbookAir  on 14/06/23.
//

import UIKit

class MoviesViewController: UIViewController {
    
    
    @IBOutlet weak var moviesCollection: UICollectionView!
    @IBOutlet weak var categoryMovies: UISegmentedControl!
    @IBOutlet weak var nameMoviesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchMovies(_ sender: UIButton) {
    }
    
    @IBAction func categorySelectedAction(_ sender: UISegmentedControl) {
    }
    
}

