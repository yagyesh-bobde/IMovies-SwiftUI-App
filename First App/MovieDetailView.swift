//
//  MovieDetailView.swift
//  First App
//
//  Created by zain khan  on 11/11/22.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        
//        ScrollView{
//            //            Color.gray
//            PosterView(movie: movie)
//            HStack{
//                Text("Overview")
//                    .multilineTextAlignment(.leading)
//            }.background(Color.gray)
//            Divider()
//            Text("\(movie.overview ?? "")")
//            MovieStaff(movie: movie)
//            }
//            .padding(5)
//        }
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
                    MovieStaff(movie: movie)
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
    
    struct MovieStaff: View {
        var movie: Movie
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        var body: some View {
//            Movie Staff

//                Directors
                LazyVGrid(columns: columns, spacing: 5){
                    ForEach(movie.directors ?? [] , id: \.id){ director in
                        PersonDetail(person: director, type: "Director")
                            .frame(width: 70 , height: 50)
                    }
                }
//                Writers
                LazyVGrid(columns: columns, spacing: 5){
                    ForEach(movie.writers ?? [] , id: \.id){ writer in
                        PersonDetail(person: writer, type: "Writer")
                            .frame(width: 100 , height: 40)
                    }
                }
//                Cast
                LazyVGrid(columns: columns, spacing: 5){
                    ForEach(movie.cast ?? [] , id: \.id){ cast in
                        PersonDetail(person: cast, type: "Cast")
                            .frame(width: 100 , height: 50)
                    }
                }
            
        }
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.sampleMovie)
    }
}
