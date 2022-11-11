//
//  MovieCard.swift
//  First App
//
//  Created by Pranav Bobde on 10/11/22.
//

import Foundation
import SwiftUI

struct MovieCard: View {
    var movie: Movie
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(
               string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(movie.poster_path ?? "")"),
               content:{ returnedImage in
                    returnedImage
                    .resizable()
                    .frame(width:50, height: 50)
                    .scaledToFit()
                    .padding(.trailing)
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
            }
            .frame(alignment:.trailing)
        }
    }
}
