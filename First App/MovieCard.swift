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
        ZStack{
            Rectangle().fill(Color.white).frame(height: 100)
            HStack{
                AsyncImage(url: URL(
                   string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(movie.poster_path ?? "")"),
                   content:{ returnedImage in
                        returnedImage
                        .resizable()
                        .frame(width:50, height: 50)
                        
                },
                   placeholder: {
                            ProgressView()
                })
                HStack{
                    VStack{
                        Text("\(movie.title ?? " ")")
                            .fontWidth(Font.Width.condensed)
                            .multilineTextAlignment(.leading)
                        Text("\(movie.tagline ?? " ")")
                            .fontWeight(Font.Weight.light)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                    }.multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
//                .border()
                .frame(alignment:.trailing)
                .padding()
                
            }
        }
    }
}
