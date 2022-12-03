//
//  CoffeeDetailView.swift
//  Coffelist
//
//  Created by Pratama Pangestu on 20/11/22.
//

import SwiftUI

import SwiftUI

struct CoffeeDetailView: View {
    // MARK: - PROPERTIES
    let coffeeDetails: CoffeeModel
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .white], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 0) {
                Image(coffeeDetails.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay {
                        ZStack {
                            Circle()
                                .opacity(0.5)
                            
                            VStack {
                                Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .renderingMode(.original)
                                    .foregroundColor(.blue)
                                    .font(.system(.largeTitle, design: .rounded))
                                    .fontWeight(.bold)
                                Text(coffeeDetails.name)
                                    .foregroundColor(.white)
                                    .font(.system(.title, design: .rounded))
                                    .fontWeight(.bold)
                            }
                        }
                        
                    }
                
                VStack(alignment: .center, spacing: -20) {
                    Text(coffeeDetails.review)
                        .padding(30)
                        .foregroundColor(.blue)
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.regular)
                        .lineSpacing(4)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack {
                        Image(systemName: "pin.circle")
                            .foregroundColor(.red)
                            .font(.system(.title2))
                        
                        Text(coffeeDetails.location)
                            .foregroundColor(.red)
                            .font(.system(.callout, design: .rounded))
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                    }
                }
                Spacer()
            }
            
        }
        
    }
}

// MARK: - PREVIEW
struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(coffeeDetails: CoffeeModel(
            image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class", isFavorite: false))
    }
}
