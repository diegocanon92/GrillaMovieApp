//
//  MovieManager.swift
//  GrillaMovieApp
//
//  Created by Diego Ernesto MacbookAir  on 22/06/23.
//

import Foundation

//protocol MoviesManagerDelegate{
    //func showMovies(listOfMovies: [Result])
    //func showError(error: String)
//}

enum MovieError: Error {
    case badUrl
    case badResponse
}
struct MovieManager{
    
    func findMovie(topic: String)async throws -> ResponseBodyModel {
        do{
            guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=Mario&include_adult=false&language=en-US&page=1")else{
                print("Error al crear url")
                throw MovieError.badUrl
            }
            
            print("URL: \(url)")
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZGJjNjliMmJjNTFjZWQyNjc5NTgyMjdmNzdlZmU0MyIsInN1YiI6IjY0OTMzMTU0ZDIxNDdjMDBhZDUxNTBhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Wx92_MoN0ApUo25dgU7pGAiB50T47ZESfX8iZgk1APg", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{
                throw MovieError.badResponse
                
                //Delegado.mostrarError
            }
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(ResponseBodyModel.self, from: data)
            
            let json = try JSONSerialization.jsonObject(with: data)
            
            print(json)
            
            //let listOfMovies = decodedData.results
            //delegate?.showMovies(listOfMovies: listOfMovies)
            
            print("result: \(decodedData.results)")
            
            return decodedData
            
        }catch{
            print("debug: error \(error.localizedDescription)")
            throw error
        }
    }
}
