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
        VStack(alignment: .leading) {
       
            
            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 20)
            
            Text(goalID!)
                .customStyle(style:Heading1Style())
            
            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 20)
            
                
            TextField("New Task", text: $taskID)
                .padding(.bottom,5).padding(.top,5).padding(.leading,35).padding(.trailing,10)
                .background(Color("lightPink"))
                .font(Font.system(size: 25, design: .default))
                .cornerRadius(4)
            
            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 20)
            
            Button(action:{
                     //TODO - handle goalID and Habits ID nil values
                     //TODO validations
                    
                    DataService.sharedDataService.insertTask(forGoalWithID: self.goalID!, taskID: self.taskID,inContext: self.sharedManagedContext)
                        
                     self.taskID = ""
                     self.getTasksforGoal()
                     self.successCallBack()

                }){
                    Text("Add Task")
                        .customStyle(style: NextLinkStyle())
                }
            .disabled(self.taskID == "")
            
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50,alignment: .center)
                
            
            
            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 20, maxHeight: 30)
           
            
            Text("Tasks for " + goalID!)
                .customStyle(style: Heading2Style()).padding(.top,20)
            
            List{
                ForEach(retrievedTasks, id: \.self){ task in
                    NavigationLink(destination: TaskView(task: task))
                    {
                        TaskRow(task:task,retrievedTasks: $retrievedTasks)
                    }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation
                }.onDelete(perform: self.deleteRow)
            }
           
            
            Spacer()
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
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
        
        .navigationBarTitle("Add Task",displayMode: .inline)
            
        //hide the default back button
        .navigationBarBackButtonHidden(true)
        
         //TODO run validations before navigating
        .navigationBarItems(
            // add a custom button with my styling
            leading: navigationBackButton(
                action:{
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            ),
            // add a button to move to Goals Home / root
            trailing: poptoHomeButton(
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
    
    
    func deleteRow(at offsets: IndexSet)->(){
        let tasksToDelete = offsets.map{ self.retrievedTasks[$0]}
        
        for taskToDelete in tasksToDelete {
            //delete from persistence
            DataService.sharedDataService.deleteTask(task: taskToDelete, inContext: self.sharedManagedContext)
            
            //remove from array used to display
            retrievedTasks.removeAll{$0 == taskToDelete}
        }

    }
}





struct CreateTasksPreviewWrapper: View {
    @State var isParentActive:Bool = false
    
    var body: some View {
        CreateTasks(isParentViewActive: $isParentActive, goalID:"Adfsa", successCallBack: {
            
        }).environment(\.managedObjectContext,PersistenceManager.shared.context)
    }
}

struct CreateTasks_Previews: PreviewProvider {
    
    
    static var previews: some View {
        CreateTasksPreviewWrapper()
    }
    
    
}
