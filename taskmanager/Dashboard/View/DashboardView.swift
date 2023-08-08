//
//  ContentView.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var vm : ViewModel = Resolver.shared.resolve(ViewModel.self)
    var body: some View {
        NavigationView {
            VStack {
//                List {
//                    ForEach(vm.storedLanguage.indices , id  : \.self) { index in
//                        Text(vm.storedLanguage[index].title ?? "Null")
//                    }
//                }
            }
            .navigationTitle("Task Manager")
            .toolbar {
                Button {
                    vm.addtocoredata()
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
