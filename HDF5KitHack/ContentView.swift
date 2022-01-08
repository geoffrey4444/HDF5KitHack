//
//  ContentView.swift
//  HDF5KitHack
//
//  Created by Geoffrey Lovelace on 1/8/22.
//

import SwiftUI
import HDF5Kit

struct ContentView: View {
  @State private var result = ""
  var body: some View {
    Text(result).padding()
    Button("Open H5 file") {
      let path = "/Users/geoffrey/Desktop/GhKerrSchildReductions.h5"
      guard let file = File.open(path, mode: .readWrite) else {
        fatalError("Failed to open \(path)")
      }
      guard let norms = file.openDoubleDataset("/Norms.dat") else {
        fatalError("Failed to open Norms.dat")
      }
      let norms_data = norms[0...0, 0...4]
      result = String(norms_data[4])
      print(norms_data)
    }.padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
