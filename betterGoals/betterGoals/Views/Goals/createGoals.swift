//
//  createGoals.swift
//  betterGoals
//
//  Created by K Janakan on 17/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct createGoals: View {
    
    @EnvironmentObject var newGoal:Goal
    
    @State var questiontoBeAnswered = 1
    var maxQuestionNumber:Int = 3
    
    var body: some View {
        VStack{
            
            VStack(spacing: 0){
                
                Text("My Goals").padding(.leading,20).foregroundColor(Color(.white))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .topLeading)
                    .background(Color("pink"))
                
                Image("mountain")
                    .resizable()
                    .scaledToFit()
            }
            
            
            VStack(alignment: .leading){
                
                Text("Let's create a goal").customStyle(style:Heading1Style())
                Text("It is time to create a goal, work on it and achieve greater things in life").customStyle(style:ContentStyle())
                
                
                Group {
                    if questiontoBeAnswered == 1 {
                        
                        createGoalsQuestionView1(
                            questionPlaceHolder:"My Goal is ...",
                            questionLabel:"What is your Goal?",
                            questionNumber: 1,
                            buttonClickObserver:self )
                            .environmentObject(newGoal)
                    }
                    else if questiontoBeAnswered == 2 {
                        
                        createGoalsQuestion2(questionResponse:"",
                                             questionPlaceHolder:"My Goal 2 ...",
                                             questionLabel:"What is your Goal 2?",
                                             questionNumber: 2,
                                             buttonClickObserver:self )
                            .environmentObject(newGoal)
                    }
                    else if questiontoBeAnswered == 3 {
                        
                        createGoalsQuestion2(questionResponse:"",
                                             questionPlaceHolder:"My Goal 3 ...",
                                             questionLabel:"What is your Goal 3?",
                                             questionNumber: 3,
                                             buttonClickObserver:self )
                            .environmentObject(newGoal)
                    }
                    
                }
                
            }
            .padding(20)
        }
            
           
    }
}


extension createGoals: QuestionNavigationCB{
    
    func nextButtonClicked() {
        
        if self.questiontoBeAnswered == self.maxQuestionNumber{
            return
        }
        
        self.questiontoBeAnswered+=1
    }
    
    func backButtonClicked() {
        if self.questiontoBeAnswered == 1 {
            return
        }
        
        self.questiontoBeAnswered-=1
    }
    
}


/* user answers the following questions in this view
   1. select a goal type
   2. describe your goal
 */
struct createGoalsQuestionView1: View, navigationButtonEnablement {

    var questionPlaceHolder:String
    var questionLabel:String
    var questionNumber:Int
    var buttonClickObserver:QuestionNavigationCB

    @State private var show_modal: Bool = false
    @EnvironmentObject var newGoal : Goal
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            // popup
            Button(action: {
                self.show_modal = true
            }) {
                HStack{
                    Text("Select the goal type").customStyle(style: Heading2Style())
                    
                    Image(systemName: "chevron.down")
                        .accentColor(Color("pink"))
                }
                
            }
            
            .sheet(isPresented: self.$show_modal) { //popup
                
                ItemTypeList(listHeading: self.questionLabel).environmentObject(self.newGoal)
            }
            
            if 0 != newGoal.itemUIType  {
                 Text(ItemTypesUIDefaults.getItemUIDefault(usingID:Int(newGoal.itemUIType)).name)
            }
            
            Spacer()
            
            
            Text("Describe your goal").customStyle(style: Heading2Style())
            
            // replace this with TextEditor when a stable release of Xcode 12 happens
            TextField(questionPlaceHolder, text: $newGoal.itemDescription)
                .padding(.bottom,10).padding(.top,10).padding(.leading,10).padding(.trailing,10)
                .background(Color("lightPink"))
                .cornerRadius(4)
            
            
            navigationButtons(buttonClickObserver: buttonClickObserver,
                              buttonEnablement: self)
                                .environmentObject(newGoal)
            
 
        }.padding(.top,30)
  
    }
    
    func isbackButtonEnabled()->Bool {
        return false
    }
    
    func isnextButtonEnabled()->Bool {
        return (self.newGoal.itemUIType != 0)
    }
    

}

struct createGoalsQuestion2: View, navigationButtonEnablement {

    @State var questionResponse: String
    @EnvironmentObject var newGoal : Goal
    
    var questionPlaceHolder:String
    var questionLabel:String
    var questionNumber:Int
    var buttonClickObserver:QuestionNavigationCB
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(questionLabel).font(Font.system(size: 15, weight: .medium, design: .serif))
                .foregroundColor(Color("purple"))
            
            
            TextField(questionPlaceHolder, text:   $questionResponse)
                .textFieldStyle((RoundedBorderTextFieldStyle()))
                .padding()
            
            
            navigationButtons(buttonClickObserver:buttonClickObserver,
                              buttonEnablement: self)
                                .environmentObject(newGoal)
            
            
            Spacer()
        }
        
    
    }
    
    func isbackButtonEnabled()->Bool {
        return true
    }
    
    func isnextButtonEnabled()->Bool {
        return true
    }
}



// protocol to receive callbacks when navigation from a quesiton is invoked
protocol QuestionNavigationCB {
    func nextButtonClicked()
    func backButtonClicked()
}

// protocol to provide logic based on which the navigation buttons would be enabled
protocol navigationButtonEnablement {
    func isbackButtonEnabled()->Bool
    func isnextButtonEnabled()->Bool
}


struct navigationButtons : View {
    
    var buttonClickObserver:QuestionNavigationCB //to provide callbacks upon button clicks
    var buttonEnablement:navigationButtonEnablement // to determine  whether buttons are enabled
    
    @EnvironmentObject var newGoal : Goal
   
    var body: some View {
        // navigation buttons
         HStack{

            //back button
             Button(
                 action:{
                     self.buttonClickObserver.backButtonClicked()
             }){
                 Image(systemName: "arrowtriangle.left.fill")
                     .accentColor(Color("pink"))
             }
             .padding(.leading,30)
             .disabled(!buttonEnablement.isbackButtonEnabled())
             
             Spacer()
             
            //next button
             Button(
                 action:{
                     self.buttonClickObserver.nextButtonClicked()
             }){
                 HStack{
                     Image(systemName: "arrowtriangle.right.fill")
                                            .accentColor(Color("pink"))
                 }
                
             }
             .padding(.trailing,30)
             .disabled(!buttonEnablement.isnextButtonEnabled())

         }.padding(.top,25)
    }
    
    
}

struct createGoals_Previews: PreviewProvider {
    static var previews: some View {
        createGoals()
    }
}
