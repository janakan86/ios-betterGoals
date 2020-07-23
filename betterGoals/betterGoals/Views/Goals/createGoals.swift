//
//  createGoals.swift
//  betterGoals
//
//  Created by K Janakan on 17/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI



struct QuestionOne:View{
    
    @EnvironmentObject var newGoal : Goal
    
    //for navigation
    @Binding var isCreateGoalsActive:Bool //root
    @Environment(\.presentationMode) var presentationMode //used by the custom back button
    
    var body: some View {
        
        VStack{
            Image("mountain")
                    .resizable()
                    .scaledToFit()
            
            VStack(alignment: .leading){
                       
                       Text("Let's create a goal").customStyle(style:Heading1Style())
                       Text("It is time to create a goal, work on it and achieve greater things in life")
                           .customStyle(style:ContentStyle())
                       
                       
                       Text("Give a name to your Goal").customStyle(style: Heading2Style()).padding(.top,20)
                       
                       TextField("", text: $newGoal.itemID)
                           .padding(.bottom,5).padding(.top,5).padding(.leading,10).padding(.trailing,10)
                           .background(Color("lightPink"))
                           .font(Font.system(size: 15, design: .default))
                           .cornerRadius(4)
                       
                       Spacer()
                       
                   }
                   .padding(20)
            
            
            NavigationLink(destination:QuestionTwo(
                  isCreateGoalsActive: self.$isCreateGoalsActive).environmentObject(self.newGoal))
            {
                      Text("next").customStyle(style: NextLinkStyle())
            }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
            .padding(.bottom,20)
            
        }
        .navigationBarTitle("Goal Name",displayMode: .inline)
            
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
                    self.isCreateGoalsActive.toggle()
                }
            )
        )
        
    }
    
}


struct QuestionTwo:View{
    @EnvironmentObject var newGoal : Goal
    @State private var show_modal: Bool = false
    
    //for navigation
    @Binding var isCreateGoalsActive:Bool //root
    @Environment(\.presentationMode) var presentationMode //used by the custom back button
    
    var body: some View {
        
        VStack{
            Image("mountain")
                    .resizable()
                    .scaledToFit()
            
            VStack(alignment: .leading){
                

                     
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
                    Text(ItemTypesUIDefaults.getItemUIDefault(usingID:Int(newGoal.itemUIType)).name).font(Font.system(size: 15, weight: .bold))
                        .padding(.bottom,10)
                        
                }
                else{
                     Spacer().padding(10)
                }
                
                Spacer()
                       

            }
            .padding(20)
            
            
            NavigationLink(destination:QuestionThree(
                  isCreateGoalsActive1: self.$isCreateGoalsActive)){
                      Text("next").customStyle(style: NextLinkStyle())
            }.isDetailLink(false) //setting to false is needed to pop back to root of Navigation View
            .padding(.bottom,20)
            
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
                    self.isCreateGoalsActive.toggle()
                }
            )
        )
        .sheet(isPresented: self.$show_modal) { //popup
                ItemTypeList(listHeading: "select a goal type").environmentObject(self.newGoal)
        }
    }
}


struct QuestionThree:View{
    @EnvironmentObject var newGoal : Goal
    @Binding var isCreateGoalsActive1:Bool
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                   Text("Let's create a goal").customStyle(style:Heading1Style())
                                      Text("It is time to create a goal, work on it and achieve greater things in life")
                                          .customStyle(style:ContentStyle())
                                      
                                      
                                      Text("Give a name to your Goal").customStyle(style: Heading2Style()).padding(.top,20)
                                      
                                      TextField("", text: $newGoal.itemID)
                                          .padding(.bottom,5).padding(.top,5).padding(.leading,10).padding(.trailing,10)
                                          .background(Color("lightPink"))
                                          .font(Font.system(size: 15, design: .default))
                                          .cornerRadius(4)
                                      
                                      Spacer()
            }//.padding(20)
            
            
  
        }
        
       
    }
    
}


struct createGoalsBackButton: View {
    
    var action:() -> Void
    
    var body: some View{
        Button(action:self.action){
            Image(systemName: "arrowtriangle.left.fill")
                .accentColor(Color(.white))
        }
    }
}

struct createGoalsPoptoRootButton: View {
    
    var action: () -> Void
    
    var body: some View{
           Button(action:self.action){
               Image(systemName: "house.fill")
                   .accentColor(Color(.white))
           }
       }
    
    
}
