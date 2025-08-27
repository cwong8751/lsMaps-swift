//
//  NavigationView.swift
//  lsMaps
//
//  Created by Carl on 8/27/25.
//

import SwiftUI
import MapKit

struct NavigationView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationManager.region, interactionModes: .all
                , showsUserLocation: true)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    HStack{
                        
                        Image(systemName: "arrow.turn.right.up").font(.system(size: 40))
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            Text("100 ft")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                            Text("N Big Bend Blvd")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // ensures it fills width and aligns left
                        .padding()
                        
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
                        Spacer()
                        VStack(alignment: .center){
                            Text("40 mins")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                            HStack{
                                Text("11:00 AM")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 4)
                                
                                Text("12 mi")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 4)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center) // ensures it fills width and aligns left
                        .padding()
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        
                    }){
                        Text("STOP").fontWeight(.bold).font(.title).foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
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
    NavigationView()
}
