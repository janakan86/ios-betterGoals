//
//  createGoals.swift
//  betterGoals
//
//  Created by K Janakan on 17/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct createGoals: View {
    
    @Environment(\.managedObjectContext) var sharedManagedContext
        
    var newGoal:Goal?
    
    @State var questiontoBeAnswered = 1
    var maxQuestionNumber:Int = 3
    
    init(){
        newGoal =  DataService.sharedDataService.createGoal(inContext: sharedManagedContext)
    }
    
    
    var body: some View {
        VStack{
            
            VStack(spacing: 0){
                
                Text("My Goals").padding(.leading,20).foregroundColor(Color(.white))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .topLeading)
                    .background(Color("pink"))
                
                Image("mountain")
                    .resizable()
                    .scaledToFit()
                    //.cornerRadius(8)
                    //.shadow(radius:4)
            }
            
            
            VStack(alignment: .leading){
                
                Text("Start creating a goal").customStyle(style:Heading1Style())
                           Text("It is time to create a goal, work on it and achieve greater things in life").customStyle(style:ContentStyle())
                           
                           
                           Group {
                               if questiontoBeAnswered == 1 {
                                   createGoalsQuestionView1(
                                                       questionPlaceHolder:"My Goal is ...",
                                                       questionLabel:"What is your Goal?",
                                                       questionNumber: 1,
                                                       buttonClickObserver:self )
                                       .environmentObject(newGoal!)
                               }
                               else if questiontoBeAnswered == 2 {
                                   
                                   createGoalsQuestion2(questionResponse:"",
                                                       questionPlaceHolder:"My Goal 2 ...",
                                                       questionLabel:"What is your Goal 2?",
                                                       questionNumber: 2,
                                                       buttonClickObserver:self )
                                       .environmentObject(newGoal!)
                               }
                               else if questiontoBeAnswered == 3 {
                                   
                                   createGoalsQuestion2(questionResponse:"",
                                                       questionPlaceHolder:"My Goal 3 ...",
                                                       questionLabel:"What is your Goal 3?",
                                                       questionNumber: 3,
                                                       buttonClickObserver:self )
                                       .environmentObject(newGoal!)
                               }
                               
                           }
                       
                }
                .padding(20)
            }
            
           
    }
}


extension createGoals: QuestionNavigationCB{
    
    func nextButtonClicked(inQuestionNumber: Int) {
        
        if inQuestionNumber == self.maxQuestionNumber{
            return
        }
        
        self.questiontoBeAnswered = inQuestionNumber + 1
    }
    
    func backButtonClicked(inQuestionNumber: Int) {
        if inQuestionNumber == 1 {
            return
        }
        
        self.questiontoBeAnswered = inQuestionNumber - 1
    }
    
}


/* user answers the following questions in this view
   1. select a goal type
   2. describe your goal
 */
struct createGoalsQuestionView1: View {

    @State var goalDescriptionInputValue: String = ""
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
            .padding(.top,30)
            .sheet(isPresented: self.$show_modal) { //popup
                
                ItemTypeList(listHeading: self.questionLabel).environmentObject(self.newGoal)
            }
            
            if 0 != newGoal.itemUIType  {
                 Text(ItemTypesUIDefaults.getItemUIDefault(usingID:Int(newGoal.itemUIType)).name)
            }
            
           
            
            Spacer()
            Text("Describe your goal").customStyle(style: Heading2Style())
            
            TextField(questionPlaceHolder, text: $goalDescriptionInputValue)
                           .textFieldStyle((RoundedBorderTextFieldStyle()))
                           .padding(.bottom,30)
            
            
            // navigation buttons
            HStack{

                Button(
                    action:{
                        self.newGoal.itemDescription = self.goalDescriptionInputValue
                        self.buttonClickObserver.backButtonClicked(inQuestionNumber: self.questionNumber)
                }){
                    Image(systemName: "arrowtriangle.left.fill")
                        .accentColor(Color("pink"))
                }
                .padding(.leading,30)
                .disabled(true) // back button is always disabled since this is the first qt
                
                Spacer()
                
                Button(
                    action:{
                        self.newGoal.itemDescription = self.goalDescriptionInputValue
                        self.buttonClickObserver.nextButtonClicked(inQuestionNumber: self.questionNumber)
                }){
                    HStack{
                        Image(systemName: "arrowtriangle.right.fill")
                                               .accentColor(Color("pink"))
                    }
                   
                }
                .padding(.trailing,30)
                .disabled(self.newGoal.itemUIType == 0)

            }
        }
        
  
    }
    

}

struct createGoalsQuestion2: View {
    
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
            
            
            HStack{
                Button("next",
                       action:{
                        self.buttonClickObserver.nextButtonClicked(inQuestionNumber: self.questionNumber)
                })
                
                Spacer()
                
                Button("Back",
                       action:{
                        self.buttonClickObserver.backButtonClicked(inQuestionNumber: self.questionNumber)
                })
            }
            
            
            Spacer()
        }
        
    
    }
}



// protocol to receive callbacks when navigation from a quesiton is invoked
protocol QuestionNavigationCB {
    func nextButtonClicked(inQuestionNumber:Int)
    func backButtonClicked(inQuestionNumber:Int)
}

struct createGoals_Previews: PreviewProvider {
    static var previews: some View {
        createGoals()
    }
}



