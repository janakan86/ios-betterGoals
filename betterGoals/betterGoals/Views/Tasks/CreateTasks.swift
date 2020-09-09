//
//  CreateTasks.swift
//  betterGoals
//
//  Created by K Janakan on 7/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct CreateTasks: View {
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    @Binding var isParentViewActive:Bool
    @Environment(\.presentationMode) var presentationMode //used by the custom back button
    
    
    @State private var show_modal: Bool = false
    
    var goalID:String?
    var habitsID:String?
    
    var body: some View {
        VStack {
            Text(goalID!)
            
            Button(action:{
                //save and go back to goals home
                //TODO validations
            /*    DataService.sharedDataService.insertTask(taskID: "Test",
                    goalID: self.goalID,habitID: nil,inContext: self.sharedManagedContext)*/
            }){
                Text("save")
            }
            
        }.navigationBarTitle("Goal Type",displayMode: .inline)
            
        //hide the default back button
        .navigationBarBackButtonHidden(true)
        
         //TODO run validations before navigating
        .navigationBarItems(
            // add a custom button with my styling
            leading: createGoalsBackButton(
                action:{
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            ),
            // add a button to move to Goals Home / root
            trailing: createGoalsPoptoRootButton(
                action:{
                    self.isParentViewActive.toggle()
                }
            )
        )
        
    }
}




/*
struct CreateTasks_Previews: PreviewProvider {
    static var previews: some View {
        CreateTasks()
    }
}
 */
