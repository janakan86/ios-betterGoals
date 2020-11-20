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
    
    @ObservedObject var retrievedTasks:retrievedTasks
    
    @State private var show_modal: Bool = false
    
    var goalID:String?
    var habitsID:String?
    
    
    var successCallBack:()->()
    
    
    @State var taskID:String = ""
    
    

   
    
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
                    
                    //store in persistence
                    DataService.sharedDataService.insertTask(forGoalWithID: self.goalID!, taskID: self.taskID,inContext: self.sharedManagedContext)
                        
                    //refresh the observed object.Which in term would refresh this view
                    self.retrievedTasks.refresh(goalID: self.goalID!, sharedManagedContext: self.sharedManagedContext)
                
                     self.taskID = ""
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
                ForEach(retrievedTasks.tasks, id: \.self){ task in
                    NavigationLink(destination: TaskView(task:task,retrievedTasks: self.retrievedTasks))
                    {
                        TaskRow(task:task,retrievedTasks: self.retrievedTasks)
                    }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation
                }.onDelete(perform: self.deleteRow)
            }
           
            
            Spacer()
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        
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
    
    
    
    func deleteRow(at offsets: IndexSet)->(){

        self.retrievedTasks.deleteTasks(atOffsets: offsets)
    
    }
}




struct CreateTasks_Previews: PreviewProvider {
    
    static var previews: some View {
        CreateTasksPreviewWrapper()
    }
    
}

struct CreateTasksPreviewWrapper: View {
    @State var isParentActive:Bool = false
    let context = PersistenceManager.shared.context
    
    var sampleGoal:Goal = getSampleGoal()
    
    var tasks = getSampleTasks()
    
    
    
    var body: some View {
        CreateTasks(isParentViewActive: $isParentActive,
                    retrievedTasks: retrievedTasks(tasks: tasks, sharedManagedContext:context),goalID:sampleGoal.goalID, successCallBack: {
            
        }).environment(\.managedObjectContext, context)
    }
    
    
    static func getSampleGoal()-> Goal{
        let sampleGoal = Goal(context: PersistenceManager.shared.context)
        sampleGoal.goalID = "sample Goal2"
        sampleGoal.goalDescription = "Need to win a gold medal"
        
        return sampleGoal
    
    }
    
    static func getSampleTasks()-> [Task]{
        
        var sampleTasks: [Task] = []
        
        let sampleTask = Task(context: PersistenceManager.shared.context)
        sampleTask.taskID = "ttttt"
        
        let sampleTask2 = Task(context: PersistenceManager.shared.context)
        sampleTask2.taskID = "qqqqq"
        
        sampleTasks.append(sampleTask)
        sampleTasks.append(sampleTask2)
        
        
        return sampleTasks
    }
}


