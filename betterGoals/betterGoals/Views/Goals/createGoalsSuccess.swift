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

    
      var goalID:String
    
      
      var body: some View {
          VStack(alignment: .leading){
              
              NavigationLink(destination:CreateTasks(
                           isParentViewActive: self.$isCreateGoalsActive,
                                retrievedTasks: retrievedTasks(goalID: goalID, sharedManagedContext: sharedManagedContext),
                                goalID: goalID, successCallBack:{
                                    
                                    
                                })// TODO handle nil
                          ){
                               Text("create tasks").customStyle(style: NextLinkStyle())
                     }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
                     .padding(.bottom,20)
    
          }
          
         
      }
}




struct createGoalsSuccess_Previews: PreviewProvider {
    static var previews: some View {
        return createGoalsSuccessPreviewWrapper()
    }
}


struct createGoalsSuccessPreviewWrapper : View {
    
    @State var isCreateGoalsActive:Bool = false
    let context = PersistenceManager.shared.context
    
    var body: some View {
        
        createGoalsSuccess(isCreateGoalsActive: $isCreateGoalsActive,
                           goalID: "Test")
            .environment(\.managedObjectContext, context)
    }
}



