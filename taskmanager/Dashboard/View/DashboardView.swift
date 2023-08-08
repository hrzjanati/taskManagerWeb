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
                            Toggle(isOn: Binding<Bool>(
                                get: { vm.storedTask[index].isCompleted },
                                set: { boolToggle in
                                    CoreDataManager.shared.updateTaskIsCompleted(id: vm.storedTask[index].id ?? "", isCompleted: boolToggle) {
                                        vm.storedTask = CoreDataManager.shared.fetchTaskFormCoreData()
                                    }
                                })) {
                                    Text(vm.storedTask[index].title ?? "Null")
                                }
                            HStack {
                                Text(vm.storedTask[index].describtion ?? "Null")
                                Spacer()
                            }
                        }
                    }
                    .onDelete(perform: removeRows)
                }
            }
            .navigationTitle("Task Manager")
            .toolbar {
                Button {
                    showingAlert.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .alert("Enter your Task", isPresented: $showingAlert) {
                    TextField("Title", text: $vm.title)
                    TextField("describtion", text: $vm.description)
                    Button("Add", action: vm.addtocoredata)
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("You can add task with title and describtion")
                }
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        if vm.storedTask.indices.contains(offsets) {
            guard let index = offsets.first else { return }
            let item = vm.storedTask[index].id
            CoreDataManager.shared.deleteTask(id: item ?? "")
        }
    }
}
//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
