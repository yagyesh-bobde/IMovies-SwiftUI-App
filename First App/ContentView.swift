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
                    MovieCard(movie: movie)
//                    HStack{
//                        AsyncImage(url: URL(
//                           string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(movie.poster_path ?? "")"),
//                           content:{ returnedImage in
//                                returnedImage
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width:75, height: 50)
//                        },
//                           placeholder: {
//                                    ProgressView()
//                        })
//                        VStack{
//                            Text("\(movie.title ?? " ")")
//                                .fontWidth(Font.Width.standard)
//                                .multilineTextAlignment(.leading)
//                            Text("\(movie.tagline ?? " ")")
//                                .fontWeight(Font.Weight.light)
//                                .multilineTextAlignment(.leading)
//                                .foregroundColor(.gray)
//                        }
//                        .frame(alignment: .leading)
//                        Spacer()
//                        Image(systemName: "chevron.right")
//                    }
                }
            }.lineSpacing(0)
        }.navigationTitle("Popular Movies")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
