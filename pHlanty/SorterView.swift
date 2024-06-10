//
//  SorterView.swift
//  FINAL1
//
//  Created by Naman Talreja on 22/12/21.
//

import SwiftUI
import UIKit
import MapKit
import CoreLocation
import CoreLocationUI

func selectTreesandShrubs() {
  
}
func selectVegetables() {
    
}
func selectFlowers() {
    
}
func selectCashCrops() {
    
}

struct SorterView: View {
    @ObservedObject var viewModel = WeatherViewModel(weatherService: WeatherService())
    private var shouldShowMenu = true
    var body: some View {
        
        
        ZStack{
            Image("Background").resizable().ignoresSafeArea()
            VStack {
                Text("pHlanty").font(.largeTitle).fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center).padding([.top, .leading, .trailing])
                    .cornerRadius(20)
                Text(" -plant your success- ")
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text ("Your location is \(viewModel.cityName)")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    
                Text ("Tne average temperature is \(viewModel.temperature)°C")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                Text ("The average humidity level is \(viewModel.humidity)%")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                
                Menu("Select Type of Plant") {
                        Button("Trees and Shrubs", action: selectTreesandShrubs)
                        Button("Vegetables", action: selectVegetables)
                        Button("Flowers", action: selectFlowers)
                        Button("Cash Crops", action: selectCashCrops)
                        
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth:  2))
                Text("OR")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                
                Button(action: {
        
                    
                }, label: {
                    Text("View All")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2))
                })

                
            }.onAppear(perform: viewModel.refresh)
                
            
            
            
        }
    }


struct SorterView_Previews: PreviewProvider {
    static var previews: some View {
        SorterView()
.previewInterfaceOrientation(.portrait)
    }
}

}
