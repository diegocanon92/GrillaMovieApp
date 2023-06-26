//
//  ViewController.swift
//  GrillaMovieApp
//
//  Created by Diego Ernesto MacbookAir  on 14/06/23.
//

import UIKit
import Kingfisher

class MoviesViewController: UIViewController {
    
    
    @IBOutlet weak var moviesCollection: UICollectionView!
    @IBOutlet weak var categoryMovies: UISegmentedControl!
    @IBOutlet weak var nameMoviesLabel: UILabel!
    
    var movies: [Result] = []
    
    var manager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        manager.delegate = self
        
        //segmented control
        getMovies(category: "Mario")
        
        setupColletion()
    }
    
    private func setupColletion(){
        moviesCollection.collectionViewLayout = UICollectionViewFlowLayout()
        
        if let flowLayout = moviesCollection.collectionViewLayout as?
            UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            
        }
    }
    func getMovies(category: String){
        Task {
            await manager.findMovie(topic: category)
        }
    }
    @IBAction func searchMovies(_ sender: UIButton) {
    }
    @IBAction func categorySelectedAction(_ sender: UISegmentedControl) {
    }
}

extension MoviesViewController: MoviesManagerDelegate {
    func showMovies(listOfMovies: [Result]) {
        self.movies = listOfMovies
        
        DispatchQueue.main.async {
            self.moviesCollection.reloadData()
            //Ocultar loader
        }
    }
    
    func showError(error: String) {
        print("Error: \(error)")
    }
    
    
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        //Modificar la imagen
        if let urlImage = URL(string: movies[indexPath.row].posterPath) {
            cell.movieImage.kf.setImage(with: urlImage)
            cell.movieImage.layer.cornerRadius = 25
        }
        return cell
    }
}

//Tamaño de la celda

extension MoviesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath ) -> CGSize {
        return CGSize(width: 130, height: 200)
    }
}
