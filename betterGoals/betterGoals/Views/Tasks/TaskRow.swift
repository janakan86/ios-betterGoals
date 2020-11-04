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
    
    var body: some View {
        
        HStack {
            
            Text(task.taskID ?? "")
            Spacer()
            
            if !task.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color("lightPink"))
            }
        }
    }
    
}
