//
//  pHView.swift
//  FINAL1
//
//  Created by Naman Talreja on 21/12/21.
//

import SwiftUI
import NavigationStack

struct pHView: View {
    @State var pHvalue:String = ""
    var body: some View {
        ZStack{
            Image("Background").resizable().ignoresSafeArea()
            VStack{
                Text("pHlanty").font(.largeTitle).fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center).padding([.top, .leading, .trailing])
                    .cornerRadius(20)
                Text(" -plant your success- ")
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 15.0)
                    
            
                Image("phScale")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(0)
                    
                HStack{
                    Spacer()
                    Text("The pH Scale is attached above. Once you have measured the pH value of the soil, enter the vaue here: ")
                        .font(.callout)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    
                }
                TextField("Enter pH value", text: $pHvalue)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 150.0)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .keyboardType(.decimalPad)
                    .padding(.bottom, 5.0)
                let pH = pHvalue
                Button  {
            
                } label: {
                    
                    PushView(destination: SorterView()) {
                    Text("Submit")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.all, 9.0)
                        .cornerRadius(11.0)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 3))
                        .padding(5.0)
                 
                    }
                }
                    
              
                
                
            }
            .padding(.bottom, 11.0)
            .transition(.opacity)
        }
    }

}

struct pHView_Previews: PreviewProvider {
    static var previews: some View {
        pHView()
    }
}
