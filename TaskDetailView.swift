//
//  TaskDetailView.swift
//  ToDoApp_SwiftUI
//
//  Created by Mac on 19/10/25.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var task: Task
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text (task.title)
                .font(.system(size: 24,weight: .bold))
                .padding(.bottom, 15)
            Button {
                task.isComplete.toggle()
                dismiss()
            } label: {
                Text(task.isComplete ? "Mark Not Done" : "Mark Done")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame (height: 45)
                    .background(Color("lightGreenShade"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: .constant(Task(title: "test", isComplete: false, priority: .normal)))
    }
}
