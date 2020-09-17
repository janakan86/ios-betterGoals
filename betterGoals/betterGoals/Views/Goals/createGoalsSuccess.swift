//
//  createGoalsSuccess.swift
//  betterGoals
//
//  Created by K Janakan on 14/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct createGoalsSuccess: View {
      @Environment(\.managedObjectContext) var sharedManagedContext
      
      @Binding var isCreateGoalsActive:Bool
      
      @EnvironmentObject var retrievedGoals:Goals
      
      @State var isGoalCreated:Bool = false
    
      @Binding var createdGoal:Goal?
    
      
      var body: some View {
          VStack(alignment: .leading){
              
              NavigationLink(destination:CreateTasks(
                           isParentViewActive: self.$isCreateGoalsActive,
                           goalID: createdGoal?.goalID)// TODO handle nil
                          ){
                               Text("create tasks").customStyle(style: NextLinkStyle())
                     }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
                     .padding(.bottom,20)
    
          }
          
         
      }
}

/*
struct createGoalsSuccess_Previews: PreviewProvider {
    static var previews: some View {
        createGoalsSuccess()
    }
}*/
