//
//  CreateTasks.swift
//  betterGoals
//
//  Created by K Janakan on 7/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct CreateTasks: View {
    
   
    
    @Binding var isParentViewActive:Bool
    @Environment(\.presentationMode) var presentationMode //used by the custom back button
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    
    @State private var show_modal: Bool = false
    
    var goalID:String?
    var habitsID:String?
    
    
    @State var retrievedTasks:[Task] = []
    
    var body: some View {
        VStack {
            Text(goalID!)
            
            ForEach(retrievedTasks, id: \.self){ task in
                Text((task as Task).taskID!)
            }
            
            Button(action:{
                self.show_modal.toggle()
                
            }){
                Text("Add sample task")
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
        .sheet(isPresented: self.$show_modal) { //popup
            createTasksSheet(goalID:self.goalID,successCallBack:self.getTasksforGoal)
                .environment(\.managedObjectContext, self.sharedManagedContext)
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




struct createTasksSheet:View{
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var sharedManagedContext
    

    
    var goalID:String?
    var habitsID:String?
    
    var successCallBack:()->()
    
    var body: some View {
        VStack{
            Button(action:{
                 //TODO - handle goalID and Habits ID nil values
                 //TODO validations
                 DataService.sharedDataService.insertTask(forGoalWithID: self.goalID!, taskID: "Test",inContext: self.sharedManagedContext)
                 self.successCallBack()
                 self.presentationMode.wrappedValue.dismiss()
            }){
                Text("dismiss")
            }
        }
    }
}



/*
struct CreateTasks_Previews: PreviewProvider {
    static var previews: some View {
        CreateTasks()
    }
}
 */
