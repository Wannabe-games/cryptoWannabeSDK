//
//  ContentView.swift
//  iOS SDK
//
//  Created by Michał Fereniec on 08/11/2022.
//

import SwiftUI

//initial commit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
