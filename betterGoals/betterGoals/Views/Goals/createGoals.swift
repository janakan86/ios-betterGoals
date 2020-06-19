//
//  createGoals.swift
//  betterGoals
//
//  Created by K Janakan on 17/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct createGoalsStep1: View {
    var body: some View {
        VStack(){
            
        Image("mountain")
             .resizable()
             .scaledToFit()
              
        
        }
        .padding(5)
    }
}


struct createGoalsQuestion: View {
    @State var question1Response: String
    
    var questionPlaceHolder:String
    var questionLabel:String
    
    var body: some View {
        VStack{
            
            Image("mountain")
                      .resizable()
                      .scaledToFit()
                      .cornerRadius(15)
                      .shadow(radius:4)
            
            
            Text(questionLabel).font(Font.system(size: 15, weight: .medium, design: .serif))
                .foregroundColor(Color("purple"))
            
            
            TextField(questionPlaceHolder, text:   $question1Response)
                .textFieldStyle((RoundedBorderTextFieldStyle()))
                .padding()
            
            Spacer()
        }
        
    
    }
}

struct createGoals_Previews: PreviewProvider {
    static var previews: some View {
        createGoalsQuestion(question1Response:"",
             questionPlaceHolder:"My Goal is ...",
             questionLabel:"What is your Goal?")
    }
}



