//
//  createGoals.swift
//  betterGoals
//
//  Created by K Janakan on 17/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct createGoals: View {
        
    var newGoal:Goal?
    @State var questiontoBeAnswered = 1
    @Environment(\.managedObjectContext) var sharedManagedContext
    var maxQuestionNumber:Int = 3
    
    init(){
        newGoal =  DataService.sharedDataService.createGoal(inContext: sharedManagedContext)
    }
    
    
    var body: some View {
        VStack(){
       
        Image("mountain")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
            .shadow(radius:4)
            
            
            Group {
                if questiontoBeAnswered == 1 {
                    createGoalsQuestion1(questionResponse:"",
                                        questionPlaceHolder:"My Goal is ...",
                                        questionLabel:"What is your Goal?",
                                        questionNumber: 1,
                                        buttonClickObserver:self )
                }
                else if questiontoBeAnswered == 2 {
                    
                    createGoalsQuestion2(questionResponse:"",
                                        questionPlaceHolder:"My Goal 2 ...",
                                        questionLabel:"What is your Goal 2?",
                                        questionNumber: 2,
                                        buttonClickObserver:self )
                }
                else if questiontoBeAnswered == 3 {
                    
                    createGoalsQuestion2(questionResponse:"",
                                        questionPlaceHolder:"My Goal 3 ...",
                                        questionLabel:"What is your Goal 3?",
                                        questionNumber: 3,
                                        buttonClickObserver:self )
                }
                
            }
        
        }
        .padding(5)
    }
}


extension createGoals: questionButtonClick{
    
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

struct createGoalsQuestion1: View {
    
    @State var questionResponse: String
    
    var questionPlaceHolder:String
    var questionLabel:String
    var questionNumber:Int
    var buttonClickObserver:questionButtonClick

    
    var body: some View {
        VStack{
            
            Text(questionLabel).font(Font.system(size: 15, weight: .medium, design: .serif))
                .foregroundColor(Color("purple"))
            
            ItemTypeList()
            
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

struct createGoalsQuestion2: View {
    
    @State var questionResponse: String
    
    var questionPlaceHolder:String
    var questionLabel:String
    var questionNumber:Int
    var buttonClickObserver:questionButtonClick

    
    var body: some View {
        VStack{
            
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



// protocol to receive callbacks
protocol questionButtonClick {
    func nextButtonClicked(inQuestionNumber:Int)
    func backButtonClicked(inQuestionNumber:Int)
}


struct createGoals_Previews: PreviewProvider {
    static var previews: some View {
        createGoals()
    }
}



