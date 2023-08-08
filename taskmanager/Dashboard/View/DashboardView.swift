//
//  ContentView.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var vm : ViewModel = Resolver.shared.resolve(ViewModel.self)
    
    
    @State private var showingAlert = false
    @State private var name = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vm.storedTask.indices , id  : \.self) { index in
                        
                        VStack {
                            Toggle(vm.storedTask[index].title ?? "Null",
                                   isOn: $vm.storedTask[index].isCompleted)
                            HStack {
                                Text(vm.storedTask[index].describtion ?? "Null")
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Task Manager")
            .toolbar {
                Button {
                    showingAlert.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .alert("Enter your name", isPresented: $showingAlert) {
                    TextField("Title", text: $vm.title)
                    TextField("describtion", text: $vm.description)
                    Button("OK", action: vm.addtocoredata)
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Xcode will print whatever you type.")
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
