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
                               Text("next").customStyle(style: NextLinkStyle())
                     }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
                     .padding(.bottom,20)
            
              
              Button(action:{
                  //save and go back to goals home
                  //TODO validations
                //  DataService.sharedDataService.insertGoal(withData: self.newGoal, inContext: self.sharedManagedContext)
                 // self.retrievedGoals.refresh(sharedManagedContext: self.sharedManagedContext)
                 // self.isCreateGoalsActive.toggle()
    
                  
              }){
                  Text("Create Tasks")
              }
              
    
          }
          
         
      }
}

/*
struct createGoalsSuccess_Previews: PreviewProvider {
    static var previews: some View {
        createGoalsSuccess()
    }
}*/
