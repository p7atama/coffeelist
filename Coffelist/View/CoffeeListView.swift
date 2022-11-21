//
//  CoffeeListView.swift
//  Coffelist
//
//  Created by Pratama Pangestu on 19/11/22.
//

import SwiftUI

struct CoffeeListView: View {
    
    @State private var searchText: String = ""
    
    private var coffeeSearchResults : [CoffeeModel] {
        let results = CoffeeModel.CoffeeshopProvider.all()
        if searchText.isEmpty {
            return results
        }
        else{
            return results.filter{
                $0.name
                    .lowercased()
                    .contains(searchText.lowercased()) || $0.location.contains(searchText)
            }
        }
    }
    
    private var suggestedResult:[CoffeeModel]{
        if searchText.isEmpty {
            return []
        }
        else{
            return coffeeSearchResults
        }
    }
    
    
    var body: some View {
        NavigationStack{
            List(coffeeSearchResults) { Result in
                NavigationLink(destination: {
                    CoffeeDetailView(CoffeDetails: Result)
                }){
                    HStack{
                        Image(Result.image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .frame(width: 100, height: 100)
                        VStack{
                            HStack{
                                Text(Result.name)
                                    .font(.system(.title2
                                                 )
                                        .bold())
                                Spacer()
                            }
                            .padding(1)
                            
                            HStack{
                                Text(Result.location)
                                    .font(.system(size: 16)
                                        .bold())
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding(1)
                            
                            HStack{
                                Text("Rating: 4/5")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Coffeeshop")
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
            prompt: "What Coffee that you're looking for?")
            {
                ForEach(suggestedResult) { result in
                    Text("Looking for \(result.name)?")
                        .searchCompletion(result.name)
                }
            }
        }//NavStack
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView()
    }
}
