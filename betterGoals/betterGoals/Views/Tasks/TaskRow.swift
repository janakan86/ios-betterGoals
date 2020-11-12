//
//  TaskRow.swift
//  betterGoals
//
//  Created by K Janakan on 5/11/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI



struct TaskRow: View {
    
    var task:Task
    @Binding var retrievedTasks:[Task]
    
    //store the taskId so that we can use it to retrieve data from the retrieved tasks binding.
    var taskIndex: Int {
        retrievedTasks.firstIndex(where: { $0.taskID == task.taskID })!
    }
    
    
    var body: some View {
        
        HStack {
            
            Text(task.taskID ?? "")
            Spacer()
            
           //we are retrieving data from the binding of the array of tasks rather than the task object. This is because the details in the task object may be obsolete
            ProgressView("", value: retrievedTasks[taskIndex].percentage, total: 100)
                .accentColor(Color("lightPink"))
                .frame(maxWidth: 40,  alignment: .trailing)
            
            
            if !task.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color("lightPink"))
            }
        }
    }
    
}
