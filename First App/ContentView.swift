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
        Text("Hello, World")
        NavigationView{
            List {
                ForEach(movies , id: \.id) {
                    movie in
                    HStack{
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(movie.poster_path ?? "")")
                        )
                        .scaledToFit()
                        .frame(width: 10.0 , height: 10.0)
                    }
                    VStack{
                        Text("\(movie.title ?? " ")")
                        Text("\(movie.tagline ?? " ")")
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
