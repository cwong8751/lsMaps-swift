//
//  SearchViewModel.swift
//  lsMaps
//
//  Created by Carl on 8/27/25.
//


import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var results: [GeoapifyResult] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var debounceTimer: AnyCancellable?
    
    private let apiKey = "1f05d34fdcdc443a93731af1f6bb1c7f"
    
    func search(text: String) {
        // Debounce user input
        debounceTimer?.cancel()
        
        guard !text.isEmpty else {
            self.results = []
            return
        }
        
        debounceTimer = Just(text)
            .delay(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.fetchResults(for: query)
            }
    }
    
    private func fetchResults(for text: String) {
        print("fetching results for autocomplete")
        guard let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://api.geoapify.com/v1/geocode/autocomplete?text=\(encodedText)&lang=en&type=amenity&filter=countrycode:us,ca&format=json&apiKey=\(apiKey)") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
                .handleEvents(receiveOutput: { data, _ in
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("🔵 Raw JSON:\n\(jsonString)")
                    } else {
                        print("⚠️ Could not decode JSON data to String")
                    }
                })
                .map(\.data)
                .decode(type: AddressAutoComplete.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("❌ Error decoding JSON: \(error)")
                    }
                }, receiveValue: { [weak self] response in
                    print("✅ Decoded \(response.results.count) results")
                    self?.results = response.results
                })
                .store(in: &cancellables)
    }
}
