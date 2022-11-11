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
        NavigationView{
            List {
                ForEach(movies , id: \.id) {
                    movie in

                        HStack{
                            AsyncImage(url: URL(
                               string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(movie.poster_path ?? "")"),
                               content:{ returnedImage in
                                    returnedImage
                                    .resizable()
                                    .frame(width:50, height: 50)
                                    .scaledToFit()
                                    
                            },
                               placeholder: {
                                        ProgressView()
                            })
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(movie.title ?? " ")")
                                        
                                    Text("\(movie.tagline ?? " ")")
                                        .fontWeight(Font.Weight.light)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .frame(alignment:.trailing)
                        }
                    
                }
            }
        }.navigationTitle("Popular Movies")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
