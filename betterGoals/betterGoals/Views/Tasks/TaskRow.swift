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
    
    //subscribed to this, just to ensure that the view gets updated,
    //when task data are changed
    @ObservedObject var retrievedTasks:retrievedTasks

    var body: some View {
        
        HStack {
            
            Text(task.taskID ?? "")
            Spacer()
            

            ProgressView("", value: task.percentage, total: 100)
                .accentColor(Color("lightPink"))
                .frame(maxWidth: 40,  alignment: .trailing)
            
        
            if task.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color("lightPink"))
            }
            else{
                Image(systemName: "star")
                    .imageScale(.medium)
                    .foregroundColor(Color("lightPink"))
            }
        }
    }
    
}
