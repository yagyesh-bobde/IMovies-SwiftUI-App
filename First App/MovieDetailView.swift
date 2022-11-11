//
//  MovieDetailView.swift
//  First App
//
//  Created by zain khan  on 11/11/22.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    var body: some View {
        
        ZStack{
//            Color.gray
            Grid(){
                GridRow(alignment: .center){
                    PosterView(movie: movie)
                }
                VStack(alignment:.leading){
                    Divider()
                    Text("Overview")
                        .multilineTextAlignment(.leading)
    //                    .background(Color.gray)
                    Divider()
                    Text("\(movie.overview ?? "")")
                    VStack(alignment:.leading){
//                      Directors
                        Grid(){
                            GridRow{
                                ForEach(movie.directors ?? [] , id: \.id){ director in
                                    PersonDetail(person: director, type: "Director")
                                        .frame(width: 70 , height: 50)
                                }
                            }
//                        Writers
                            GridRow{
                                ForEach(movie.writers ?? [] , id: \.id){ writer in
                                    PersonDetail(person: writer, type: "Writer")
                                        .frame(width: 100 , height: 50)
                                }
                        }
//                        Cast
                        GridRow{
                            ForEach(movie.cast ?? [] , id: \.id){ cast in
                                PersonDetail(person: cast, type: "Cast")
                                    .frame(width: 100 , height: 50)
                            }
                    }
                    }
                }
                
                
//                GridRow{
//
//                    Grid(){
//                        GridRow{
//    //                        Directors
//                        }
//                        GridRow{
//    //                        Writers
//                        }
//                        GridRow{
//    //                        Cast
//                        }
//                    }
//                }
            }
            .padding(14.0)
        }
        .padding(5)
    }
}


struct PosterView: View {
    var movie: Movie
    
    var body: some View {
            ZStack(alignment: .center){
//                Rectangle().fill(.white).frame(height: 250)
                VStack(alignment: .center){
                    AsyncImage(url: URL(
                       string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(movie.poster_path ?? "")"),
                       content:{ returnedImage in
                            returnedImage
                            .resizable()
                            .frame(width:135, height: 225)
                            .scaledToFit()
                            .padding(.trailing)
                    },
                       placeholder: {
                                ProgressView()
                    })
                    HStack{
                        Text("\(movie.title ?? " ")")
                            .bold()
                        Text("(\(movie.release_date?.components(separatedBy: "-")[0] ?? ""))")
                    }
                    
                    Text("\(movie.certification ?? "") | \(movie.release_date ?? "") | \(movie.original_language ?? "")")
                        .foregroundColor(Color.gray)
                }
        }.navigationTitle("\(movie.title ?? " ")")
    }
}

struct PersonDetail: View {
    var person: people
    var type: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(person.name ?? "")")
            Text("\(type)")
                .foregroundColor(Color.gray)
        }
    }
}




struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.sampleMovie)
    }
}
