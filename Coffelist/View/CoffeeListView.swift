//
//  CoffeeDetailView.swift
//  Coffelist
//
//  Created by Pratama Pangestu on 20/11/22.
//

import SwiftUI
import CachedAsyncImage
import ActivityView

struct CoffeeListView: View {
    
    // MARK: - PROPERTIES
    @State private var isLoading: Bool = true

    private var coffeeResult: [CoffeeModel] {
        let result = CoffeeModel.CoffeeProvider.all()
        
       
        return result
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(coffeeResult) { result in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: {
                            CoffeeDetailView(coffeeDetails: result)
                        }) {
                            EmptyView()
                            
                            
                        }
                        .opacity(0)
                        
                        CoffeeRow(viewModel: result)
        
                    } //: ZSTACK
                    
                }
                .onDelete { indexSet in
                
                }
                
                .redacted(reason: isLoading ? .placeholder : [])
                
                .onAppear {
                    fetchData()
                }
                .listRowSeparator(.hidden)
                
            }
            .refreshable {
                print("Content Refresh")
            }
            
            .listStyle(.plain)
            
        } //: NavigationStack
        .navigationTitle("Coffee Shop")
        
    } // MARK : NAVIGATION
    
    // MARK: - Function
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

// MARK: - PREVIEW
struct CoffeeshopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView()
    }
}

// MARK: - SUBVIEW
struct CoffeeRow: View {
    @State var viewModel: CoffeeModel
    @State private var item: ActivityItem?
    @State private var isShowingAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image("\(viewModel.image)")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
                .frame(width: 120, height: 120)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("\(viewModel.name)")
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text("\(viewModel.location)")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text("Rating: 4/5")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                    .padding(2)
            }
            
            VStack(alignment: .leading) {
                if viewModel.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                        .padding(.leading)
                }
                
            } //: VStack
            
        } //: HSTACK
        
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                viewModel.isFavorite.toggle()
            } label: {
                viewModel.isFavorite ? Image(systemName: "heart.slash") : Image(systemName: "heart")
            }
            .tint(.green)
            
            Button {
                item = ActivityItem(items: "Coffee Shop with name: \(viewModel.name) will be shared!")
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.indigo)
        }
        
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Not yet Available"), message: Text("This feature is not available yet"), dismissButton: .default(Text("OK")))
        }
        
        .contextMenu {
            Button {
                isShowingAlert.toggle()
            } label: {
                HStack {
                    Text("Pin this location")
                    Image(systemName: "pin")
                }
            }
           

            Button {
                viewModel.isFavorite.toggle()
            } label: {
                Text(viewModel.isFavorite ? "Remove from favorites" : "Mark as favorites")
                viewModel.isFavorite ? Image(systemName: "heart.slash") : Image(systemName: "heart")
            }
            
            Button {
                item = ActivityItem(items: "Coffee Shop with name: \(viewModel.name) will be shared!")
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .activitySheet($item)
    }
    
}
