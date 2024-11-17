
import SwiftUI

struct ContentView: View {
    
    @State var movies: [Movie] = []
    
    
    var body: some View {
            NavigationView{
                List {
                    ForEach(movies , id: \.id) {
                        movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)){
                            MovieCard(movie: movie)
                        }
                    }
            }.navigationTitle("Popular Movies")
            .onAppear{
                API().decode { (movies) in // Calling the API
                    self.movies = movies // Setting the movies state after API Call
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
