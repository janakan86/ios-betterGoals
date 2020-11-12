//
//  TaskView.swift
//  betterGoals
//
//  Created by K Janakan on 5/11/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    
    @State var task:Task
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    var body: some View {
        
        VStack{
            Text(task.taskID ?? "")
            
            Slider(value: $task.percentage, in: 0...100, step:10)
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

