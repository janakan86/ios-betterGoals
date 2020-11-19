//
//  TaskView.swift
//  betterGoals
//
//  Created by K Janakan on 5/11/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    
    var task:Task
    @ObservedObject var retrievedTasks:retrievedTasks
    
    var taskIndex: Int {
        retrievedTasks.tasks.firstIndex(where: { $0.taskID == task.taskID })!
    }
    
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    var body: some View {
        
        VStack{
            Text(task.taskID ?? "")
            
            Button(action: {
                self.retrievedTasks.toggleIsFavorite(index: taskIndex)
            }) {
                if self.retrievedTasks.tasks[self.taskIndex]
                    .isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(Color.gray)
                }
            }
            
            Slider(value: $retrievedTasks.tasks[taskIndex].percentage, in: 0...100, step:10)
                .accentColor(Color("pink"))
            
        }.onDisappear {
            do {
                try sharedManagedContext.save()
                
            } catch{
                sharedManagedContext.rollback()
            }
        }
    }
}

