//
//  SearchView.swift
//  lsMaps
//
//  Created by Carl on 8/27/25.

import SwiftUI
import Combine

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            // Search input
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

            // List of results
            List(viewModel.results, id: \.placeId) { result in
                VStack(alignment: .leading) {
                    Text(result.formatted ?? "Unknown address")
                        .font(.body)
                    Text(result.addressLine2 ?? "")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .listStyle(.plain)

            Spacer()
        }
        .padding(.top)
        .navigationTitle("Search")
        .onChange(of: searchText) { newValue in
            viewModel.search(text: newValue)
        }
    }
}

#Preview {
    SearchView()
}
