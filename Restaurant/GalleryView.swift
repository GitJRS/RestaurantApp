//
//  GalleryView.swift
//  Restaurant
//
//  Created by MacBook2014 on 3/23/24.
//

import SwiftUI

struct GalleryView: View {
  
  @State var photoData = [String]()
  @State var isSheetVisible = false
  @State var selectedPhoto = ""
  var dataService = DataService()
  
  var body: some View {
    VStack (alignment: .leading) {
      Text("Gallery")
        .font(.largeTitle)
        .bold()
      
      GeometryReader { proxy in
        ScrollView (showsIndicators: false){
          LazyVGrid ( columns: [
            GridItem(spacing: 10),
            GridItem(spacing: 10),
            GridItem(spacing: 10)
          ], spacing: 10) {
            
            ForEach (photoData, id: \.self) { p in
              Image(p)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: (proxy.size.width - 20) / 3)
                .clipped()
                .cornerRadius(10)
                .onTapGesture {
                  selectedPhoto = p
                  isSheetVisible = true
                }
            }
          }
        }
      }
    }
    .padding(.horizontal)
    .onAppear {
      photoData = dataService.getPhotos()
    }
    .sheet(isPresented: $isSheetVisible) {
      PhotoView(selectedPhoto: $selectedPhoto,
                sheetVisible: $isSheetVisible)
    }
  }
}

#Preview {
  GalleryView()
}
