//
//  CreateTasks.swift
//  betterGoals
//
//  Created by K Janakan on 7/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct CreateTasks: View {
    
    @Binding var isParentViewActive:Bool //used by the custom home button to navigate to the parent that passed the binding
    
    @Environment(\.presentationMode) var presentationMode //used by the custom back button to go back to previous view in the navigation
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    
    @State private var show_modal: Bool = false
    
    var goalID:String?
    var habitsID:String?
    
    
    var successCallBack:()->()
    
    
    @State var taskID:String = ""
    
    
    
    
    @State var retrievedTasks:[Task] = []
    
    var body: some View {
        VStack {
            Text(goalID!)
            
            Text("")
            TextEditor( text: $taskID)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 100)
                .background(Color("lightPink"))
                .font(Font.system(size: 15, design: .default))
                .cornerRadius(4)
                
            
            
            Button(action:{
                 //TODO - handle goalID and Habits ID nil values
                 //TODO validations
                
                DataService.sharedDataService.insertTask(forGoalWithID: self.goalID!, taskID: self.taskID,inContext: self.sharedManagedContext)
                    
                 self.taskID = ""
                 self.getTasksforGoal()
                 self.successCallBack()

            }){
                Text("Save Task")
                    .customStyle(style: NextLinkStyle())
            }.disabled(self.taskID == "")
            
            
            
            ForEach(retrievedTasks, id: \.self){ task in
                Text((task as Task).taskID!)
            }
            

            
        }
        .onAppear(){
            guard self.habitsID != nil || self.goalID != nil else {
                return
            }
            
            if self.habitsID != nil{
              //TODO implement
            }
            else if self.goalID != nil{
                self.getTasksforGoal()
            }
            

            
        }
 
        
        .navigationBarTitle("Goal Type",displayMode: .inline)
            
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
    
    func getTasksforGoal()->(){
        self.retrievedTasks.removeAll()
        let tasks =  DataService.sharedDataService.getTasks(byGoalID: self.goalID!, inContext: self.sharedManagedContext)
        self.retrievedTasks.append(contentsOf: tasks)
    }
}





/*
struct CreateTasks_Previews: PreviewProvider {
    static var previews: some View {
        CreateTasks()
    }
}
 */
