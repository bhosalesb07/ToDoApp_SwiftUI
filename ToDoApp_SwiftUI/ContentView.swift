//
//  ContentView.swift
//  ToDoApp_SwiftUI
//
//  Created by Mac on 19/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var addTask:Bool = false
    @State var tasks: [Task] = []
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    //MARK: binding
                    // ForEach($tasks) { $task in
                    ForEach(tasks) { task in
                        Button(action: {
                            //task.isComplete.toggle()
                            if let taskIndex = tasks.firstIndex(where: {$0.id == task.id}){
                                tasks[taskIndex] = Task(title: task.title, isComplete: !task.isComplete, priority: task.priority)
                            }
                        }, label: {
                            HStack {
                                Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black)
                                Text(task.title)
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black)
                                Spacer()
                                Text(task.priority.title)
                                    .font(.system(size: 15, weight: .bold))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 5)
                                    .foregroundStyle(task.priority.color)
                                    .background(Capsule().fill(task.priority.color.opacity(0.4)))
                            }
                        })
                    }
                    .onDelete(perform: delete)
                }                }
            
            .sheet(isPresented: $addTask) {
                AddTaskView(taskList: $tasks)
            }
            .navigationTitle("To Do APP")
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing){
                    Button {
                        addTask = true
                    } label: {
                        Text("+")
                            .font(.system(size: 24,weight: .bold))
                            .foregroundColor(.black)
                            .padding(.trailing,15)
                    }
                    
                }
            }
        }
    }
    private func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
