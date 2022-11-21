//
//  CoffeeDetailView.swift
//  Coffelist
//
//  Created by Pratama Pangestu on 20/11/22.
//

import SwiftUI

struct CoffeeDetailView: View {
    let CoffeDetails: CoffeeModel
    
    var body: some View {
        ZStack{
            LinearGradient(colors:[.white,.white,.blue],startPoint: .topLeading,endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                
                Image(CoffeDetails.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipShape(Circle())
                    .overlay {
                        ZStack {
                            Circle()
                                .opacity(0.6)

                            VStack {
                                Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(height: 68)
                                    .scaledToFit()
                                    .foregroundColor(.blue)
                                    
                                Text(CoffeDetails.name)
                                    .font(.system(.title
                                                 )
                                        .bold())
                            }
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                        }
                    }
                    
                Text(CoffeDetails.review)
                    .font(.system(size: 18, design: .rounded))
                    .lineSpacing(6)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
                
                ZStack {
                    HStack{
                        Circle()
                            .fill(.pink)
                            .frame(width: 28, height: 30)
                            .overlay {
                                ZStack {
                                    Circle()
                                        .opacity(0)

                                    VStack {
                                        Image(systemName: "pin")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 16, height: 20)
                                            .scaledToFit()
                                            .foregroundColor(.pink)
                                            
                                        
                                    }
                                    
                                }
                            }
                        
                        Text(CoffeDetails.location)
                            .font(.system(size: 18, design: .rounded))
                            .lineSpacing(6)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.pink)
                        
                    }
                }
                    
                Spacer()
                
               
            }
            .padding()
        }
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(CoffeDetails: CoffeeModel(image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class"))
    }
}
