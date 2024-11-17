
import SwiftUI

// Movie Deatil Page UI - Medium Challenge
struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View {
        Divider()
        ScrollView{
            PosterView(movie: movie)
            ZStack(alignment: .leading) {
                Rectangle().fill(Color.gray)
                Text("Overview")
                //                    .bold()
                    .padding(.leading , 15)
                    .padding(.bottom, 5)
                    .padding(.top , 5)
            }
            VStack(alignment: .leading ) {
                Text("\(movie.overview ?? "")")
                MovieStaff(movie: movie)
                    .padding(.top , 25)
            }.padding(15)
        }
        
        .navigationBarTitle("\(movie.title ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top, 5)
    }
}
    
struct PosterView: View {
    var movie: Movie
    
    var body: some View {
        ZStack(alignment: .center){
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
        GridItem(.flexible(minimum: 40), spacing: 0),
        GridItem(.flexible(minimum: 40),   spacing: 0)
    ]
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 30){
            //                Directors
            LazyVGrid(columns: columns, alignment: .leading, spacing: 5){
                            ForEach(movie.directors ?? [] , id: \.id){ director in
                                PersonDetail(person: director, type: "Director")
                            }
                        }
            //                Writers
                        LazyVGrid(columns: columns, alignment: .leading,spacing: 5){
                            ForEach(movie.writers ?? [] , id: \.id){ writer in
                                PersonDetail(person: writer, type: "Writer")
                            }
                        }
            //                Cast
                        LazyVGrid(columns: columns, alignment: .leading, spacing: 5){
                            ForEach(movie.cast ?? [] , id: \.id){ cast in
                                PersonDetail(person: cast, type: "Cast")
                            }
                        }
        }
    }
}
