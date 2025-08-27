//
//  SearchView.swift
//  lsMaps
//
//  Created by Carl on 8/27/25.
//
import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    // Mock search result list (replace with real search logic later)
    let sampleLocations = [
        "Golden Gate Bridge",
        "Yosemite National Park",
        "Apple Park",
        "Statue of Liberty",
        "Eiffel Tower"
    ]
    
    var filteredLocations: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return sampleLocations.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            // Top bar with search field
            HStack {
                Spacer()
                TextField("Where do you want to go", text: $searchText)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.secondary.opacity(0.5), lineWidth: 1)
                    )
                    .background(Color.white)
                    .padding(.horizontal)
                Spacer()
            }
            .padding(.bottom, 10)
            
            // List of search results
            List(filteredLocations, id: \.self) { location in
                Text(location)
            }
            .listStyle(.plain)
            
            Spacer()
        }
        .navigationTitle("Search")
    }
}


#Preview {
    SearchView()
}
