//
//  ContentView.swift
//  lsMaps
//
//  Created by Carl on 8/27/25.
//


import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State private var launchSearchPage: Bool = false
    
    var body: some View {
        ZStack{
            // map view
            Map(coordinateRegion: $locationManager.region, interactionModes: .all
                , showsUserLocation: true)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                // top bar
                HStack{
                    Spacer()
                    VStack{
                        Text("lsMaps")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        
                        Button(action: {
                            launchSearchPage = true
                        }) {
                            HStack {
                                Text("Where do you want to go")
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 1)
                            )
                            .background(Color.white)
                            .cornerRadius(30)
                        }
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                .frame(maxWidth: .infinity)
                .background(
                    Color.white
                        .opacity(0.7)
                )
                
                Spacer()
                
                HStack{
                    Button(action: {
                        // Your action here
                    }) {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                    
                    Button(action: {
                        // Your action here
                    }) {
                        VStack {
                            Image(systemName: "briefcase.fill")
                            Text("Work")
                        }
                        .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
            }
        }
        .sheet(isPresented: $launchSearchPage) {
            SearchView()
        }
    }
}

#Preview {
    ContentView()
}
