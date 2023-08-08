//
//  ContentView.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .navigationTitle("Task Manager")
            .toolbar {
                Button {
                    print("Image tapped!")
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
