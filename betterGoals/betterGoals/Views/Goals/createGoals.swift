//
//  createGoals.swift
//  betterGoals
//
//  Created by K Janakan on 17/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI



struct QuestionOne:View{
    
    @EnvironmentObject var newGoal : NewGoal
    
    //for navigation
    @Binding var isCreateGoalsActive:Bool //root
    @Environment(\.presentationMode) var presentationMode //used by the custom back button
    
    
    
    var body: some View {
        
        VStack{
            
            //image on top
            VStack(spacing: 0) {
                Image("mountain")
                    .resizable()
                    .scaledToFit().padding(.bottom,0)
                   
                
            }
            .hideIfKeyBoardIsPresent()
    
            
            VStack(alignment: .leading){
                   
             
                    Group{
                        Text("Let's create a goal").customStyle(style:Heading1Style())
                        Text("It is time to create a goal and work on it")
                            .customStyle(style:ContentStyle())
                    }
                    
              
      
                
                Text("Name of the Goal").customStyle(style: Heading2Style()).padding(.top,20)
                TextField("", text: $newGoal.goalID)
                    .padding(.bottom,5).padding(.top,5).padding(.leading,10).padding(.trailing,10)
                    .background(Color("lightPink"))
                    .font(Font.system(size: 15, design: .default))
                    .cornerRadius(4)
             
                

                Spacer().frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 80)
                
                Text("Goal Description").customStyle(style: Heading2Style()).padding(.top,20)
                
                TextEditor( text: $newGoal.goalDescription)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 100)
                    .padding(.bottom,5).padding(.top,5).padding(.leading,10).padding(.trailing,10)
                    .background(Color("lightPink"))
                    .font(Font.system(size: 15, design: .default))
                    .cornerRadius(4)
                
                Spacer()
                       
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,0)
            
            
            
            NavigationLink(destination:QuestionTwo(
                  isCreateGoalsActive: self.$isCreateGoalsActive).environmentObject(self.newGoal))
            {
                      Text("Next").customStyle(style: NextLinkStyle())
            }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
            .padding(.bottom,20)
            
        }
        .navigationBarTitle("Let's create a goal",displayMode: .inline)
            
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
                    self.isCreateGoalsActive.toggle()
                }
            )
        )

    
}
}

struct QuestionTwo:View{
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    @EnvironmentObject var retrievedGoals:Goals
    @EnvironmentObject var newGoal : NewGoal
    
    
    //for navigation
    @Binding var isCreateGoalsActive:Bool //root
    @Environment(\.presentationMode) var presentationMode //used by the custom back button
    
    @State private var show_modal: Bool = false
    
    @State var isGoalCreated:Bool = false
    
    @State var newlyCreatedGoal:Goal?
    
    var body: some View {
        
        VStack{
            
            //image on top
            VStack(spacing: 0) {
                Image("mountain")
                    .resizable()
                    .scaledToFit().padding(.bottom,0)
                
                Rectangle().frame(maxWidth: .infinity,
                     minHeight:0, maxHeight:20,
                     alignment: .leading)
                    .foregroundColor(Color("pink"))
                    .padding(.top,0)
            }
            
            VStack(alignment: .leading){
                
                //goal type
                Button(action: {
                    self.show_modal = true
                }) {
                    HStack{
                        Text("Select the goal type").customStyle(style: Heading2Style())
                        
                        Image(systemName: "chevron.right")
                            .accentColor(Color("pink"))
                    }
                }
                
                
                if 0 != newGoal.itemUIType  {
                    Text(ItemTypesUIDefaults.getItemUIDefault(usingID:Int(newGoal.itemUIType)).name)
                        .customStyle(style: Heading2StyleBrown())
                        .padding(.leading,10)
                }
                
                Spacer()
                
                Group{
                    Text("I will start working on my goal from")
                        .customStyle(style: Heading2Style())
                    DatePicker(selection: $newGoal.startDate, in: ...Date(), displayedComponents: .date) {
                    }
                    .accentColor(Color("lightBrown"))
                    .fixedSize().frame(maxWidth: .infinity, alignment: .leading)
                    
                }.padding(.leading,0)
                
        
                
                Spacer()
                
                Group{
                    Text("I plan to achieve the goal by")
                        .customStyle(style: Heading2Style())
                    DatePicker(selection: $newGoal.endDate, in: ...Date(), displayedComponents: .date) {
                                   
                    }
                    .accentColor(Color("lightBrown"))
                    .fixedSize().frame(maxWidth: .infinity, alignment: .leading)
                }
               
                
                Spacer()
  
                
            }
            .padding(20)
            
            
            Button(action:{
                //save and go back to goals home
                //TODO validations
                self.newlyCreatedGoal = DataService.sharedDataService.insertGoal(withData: self.newGoal, inContext: self.sharedManagedContext)
                
                self.isGoalCreated.toggle()
                self.retrievedGoals.refresh(sharedManagedContext: self.sharedManagedContext)
                
                
            })
            {
                Text("Save")
                 .customStyle(style: NextLinkStyle())
                    
            }
            
            
            NavigationLink(destination:createGoalsSuccess(
                isCreateGoalsActive: self.$isCreateGoalsActive,
                goalID: newlyCreatedGoal!.goalID),
                
                isActive: $isGoalCreated
                
            ){
            }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
                .padding(.bottom,20)
            
        }
        .navigationBarTitle("Let's create a goal",displayMode: .inline)
            
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
                    self.isCreateGoalsActive.toggle()
                }
            )
        ).sheet(isPresented: self.$show_modal) { //popup
            ItemTypeList(listHeading: "select a goal type").environmentObject(self.newGoal)

            }
       
        }
    }







/* previews */
struct createGoals_Previews: PreviewProvider {
    
    
    static var previews: some View {
        previewWrapperQuestionOne()
    }
}

struct previewWrapperQuestionOne: View {
    
    @State var isActive:Bool = true

    
    var body: some View {
        
        NavigationView{
            NavigationLink(destination:  QuestionOne(isCreateGoalsActive: $isActive).environmentObject(NewGoal()),
                                     isActive: $isActive)
                      {  EmptyView() }
                      .isDetailLink(false)
        }
       
    }
}


struct previewWrapperQuestionTwo: View {
    
    @State var isActive:Bool = true

    
    var body: some View {
        
        NavigationView{
            NavigationLink(destination:  QuestionTwo(isCreateGoalsActive: $isActive).environmentObject(NewGoal()),
                                     isActive: $isActive)
                      {  EmptyView() }
                      .isDetailLink(false)
        }
       
    }
}
