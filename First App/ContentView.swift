//
//  ContentView.swift
//  First App
//
//  Created by Pranav Bobde on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    
    private var movies: [Movie] = Movie.allMovies
    
    var body: some View {
        NavigationView{
            List {
                ForEach(movies , id: \.id) {
                    movie in
                    Text("(movie.title)")
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
