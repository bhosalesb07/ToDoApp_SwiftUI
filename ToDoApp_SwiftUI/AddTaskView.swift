//
//  AddTaskView.swift
//  ToDoApp_SwiftUI
//
//  Created by Mac on 19/10/25.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var taskList: [Task]
    @Environment(\.dismiss) var dismiss
    
    
    @State private var taskTitle:String = ""
    @State private var selectedPriority :Priority = .normal
    
    @State private var alerttitle:String = ""
    @State private var alertMessage:String = ""
    @State private var showAlert:Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 15){
            Text("Task Title")
                .font(.system(size: 16,weight: .bold))
            TextField("Task Title", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: .infinity)
            
            Text("Task Title")
                .font(.system(size: 16,weight: .bold))
            Picker("Priority", selection: $selectedPriority) {
                ForEach(Priority.allCases) { item in
                    Text(item.title)
                        .tag(item)
                }
            }
            Button {
                
                guard taskTitle.count >= 2 else
                {
                    alerttitle = "Invalid Title"
                    alertMessage = "Title must be greater than 2 characters"
                    showAlert = true
                    return
                }
                
                taskList.append(Task(title: taskTitle, isComplete: false, priority: selectedPriority))
                
                dismiss()
            } label: {
                Text("Add task")
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color("lightGreenShade"))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Spacer()
        }.padding(.horizontal)
            .padding(.top,20)
            .alert(alerttitle, isPresented: $showAlert) {
                Button {
                } label: {
                    Text("Ok")
                }
            } message: {
                Text(alertMessage)
            }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskList: .constant([]))
    }
}
