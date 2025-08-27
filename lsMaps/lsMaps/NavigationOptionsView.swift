//
//  NavigationOptionsView.swift
//  lsMaps
//
//  Created by Carl on 8/27/25.
//
import SwiftUI
import MapKit

struct NavigationOptionsView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack{
            // map view
            Map(coordinateRegion: $locationManager.region, interactionModes: .all
                , showsUserLocation: true)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    HStack{
                        Text("Your location → Home")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.bottom, 4)
                    }
                    Spacer()
                    
                    
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                .frame(maxWidth: .infinity)
                .background(
                    Color.white
                )
                
                Spacer()
                
                VStack{
                    HStack{
                        Button(action: {
                            // Your action here
                        }) {
                            VStack {
                                Image(systemName: "motorcycle.fill")
                                Text("Moto")
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                        Button(action: {
                            // Your action here
                        }) {
                            VStack {
                                Image(systemName: "moped.fill")
                                Text("Moped")
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                        Button(action: {
                            // Your action here
                        }) {
                            VStack {
                                Image(systemName: "bicycle")
                                Text("Cycle")
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }
                    .padding(.top)
                    
                    
                    HStack{
                        Spacer()
                        VStack(alignment: .leading){
                            Text("40 mins")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                            
                            Text("Route via N Big bend Rd")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // ensures it fills width and aligns left
                        .padding()
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        
                    }){
                        Text("GO ").fontWeight(.bold).font(.title).foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .padding()
                            .cornerRadius(20)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .frame(maxWidth: .infinity)
                .background(
                    Color.white
                )
            }
        }
    }
}

#Preview {
    NavigationOptionsView()
}
