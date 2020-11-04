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
    
    var body: some View {
        Text(task.taskID ?? "")
    }
}

