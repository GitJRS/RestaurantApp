//
//  MenuView.swift
//  Restaurant
//
//  Created by MacBook2014 on 3/23/24.
//

import SwiftUI

struct MenuView: View {
  
//  @State var menuItems:[MenuItem] = [MenuItem]()
  @State var menuItems:[MenuItem] = []
  var dataService = DataService()
  
  var body: some View {
    
    List(menuItems) { thisItem in
      
      MenuListRow(item: thisItem)
      
    }
    .listStyle(.plain)
    // run when List is shown
    .onAppear {
      // Call for data
      menuItems = dataService.getData()
    }
    
  }
}

#Preview {
  MenuView()
}
