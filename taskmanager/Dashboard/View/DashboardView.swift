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
                Picker("", selection: $vm.currentStatus) {
                    ForEach(vm.statusOfTask, id: \.self) {
                         Text($0)
                     }
                 }
                 .pickerStyle(.segmented)
                 .padding(.horizontal)
                List {
                    ForEach(vm.storedTask.filter({$0.isCompleted == vm.state}) ) { task in
                        VStack {
                            Toggle(isOn: Binding<Bool>(
                                get: { task.isCompleted },
                                set: { boolToggle in
                                    CoreDataManager.shared.updateTaskIsCompleted(id: task.id ?? "", isCompleted: boolToggle) {
                                        vm.storedTask = CoreDataManager.shared.fetchTaskFormCoreData()
                                    }
                                })) {
                                    Text(task.title ?? "Null")
                                        .font(.headline)
                                        .foregroundColor(.blue.opacity(0.8))
                                        .bold()
                                }
                             
                            HStack {
                                Text(task.describtion ?? "Null")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                    }
                    .onDelete(perform: vm.removeRows)
                }
            }
            .navigationTitle("Task Manager")
            .toolbar {
                Button {
                    vm.showingAlert.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .alert("Enter your Task", isPresented: $vm.showingAlert) {
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
}
//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
