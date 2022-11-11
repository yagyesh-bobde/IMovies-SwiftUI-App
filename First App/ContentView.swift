//
//  ContentView.swift
//  First App
//
//  Created by Pranav Bobde on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    
    var movies: [Movie] = Movie.allMovies
    var sampleMovie: Movie = Movie.sampleMovie
    
    
    var body: some View {
        ZStack{
            NavigationView{
                    List {
                        ForEach(movies , id: \.id) {
                            movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)){
                                MovieCard(movie: movie)
                            }
                        }
                }.navigationTitle("Popular Movies")
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
