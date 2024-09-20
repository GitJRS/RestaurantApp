//
//  MenuItem.swift
//  Menu
//
//  Created by MacBook2014 on 3/20/24.
//

import Foundation

struct MenuItem: Identifiable {
  var id: UUID = UUID()
  var name: String
  var price: String
  var imageName: String
}
