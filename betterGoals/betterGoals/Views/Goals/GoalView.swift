//
//  GoalView.swift
//  betterGoals
//
//  Created by K Janakan on 13/10/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct GoalView: View {
    
    var goalToDisplay:Goal
    
    @State var isGoalViewActive:Bool = false;
    
    var body: some View {
        NavigationView{
            NavigationLink(destination:CreateTasks(
                            isParentViewActive: self.$isGoalViewActive,
                              goalID: goalToDisplay.goalID, successCallBack:{
                                  
                                  
                              })// TODO handle nil
                        ){
                             Text("create tasks").customStyle(style: NextLinkStyle())
                   }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
                   .padding(.bottom,20)
        }
        Text(goalToDisplay.goalDescription)
    }
}


struct GoalView_Previews: PreviewProvider {
 
    static var previews: some View {
        GoalView(goalToDisplay:getSampleGoal())
    }
    
    static func getSampleGoal()-> Goal{
        let sampleGoal = Goal(context: PersistenceManager.shared.context)
        sampleGoal.goalID = "sample Goal"
        sampleGoal.goalDescription = "Need to win a gold medal"
        return sampleGoal
    }
}

