import SwiftUI
import Combine

struct ContentView: View {
    @State private var movies: [Movie] = []
    @State private var search: String = ""
    
    private var httpClient: HTTPClient
    @State private var cancellables: Set<AnyCancellable> = []
    private var searchSubject = CurrentValueSubject<String, Never>("")
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    // Setup search publisher only once during initialization
    private func setupSearchPublisher() {
        searchSubject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: { searchText in
                loadMovies(search: searchText)
            })
            .store(in: &cancellables)
    }
    
    // Load movies based on the search term
    private func loadMovies(search: String) {
        httpClient.fetchMovies(search: search)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { movies in
                self.movies = movies
            })
            .store(in: &cancellables)
    }
    
    var body: some View {
        NavigationStack {
            List(movies) { movie in
                HStack {
                    AsyncImage(url: movie.poster) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(movie.title)
                }
            }
            .onAppear {
                setupSearchPublisher()
            }
            .searchable(text: $search)
            .onChange(of: search) { search in
                searchSubject.send(search)
            }
        }
    }
}

#Preview {
    ContentView(httpClient: HTTPClient())
}
