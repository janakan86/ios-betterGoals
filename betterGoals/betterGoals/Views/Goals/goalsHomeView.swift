//
//  goalsHome.swift
//  betterGoals
//
//  Created by K Janakan on 1/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI
import CoreData

struct goalsHomeView: View {
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    @EnvironmentObject var retrievedGoals:Goals
    
    @State var isCreateGoalsShown:Bool = false
    
    
    var createGoalsButton: some View{
        Button(action:{
            self.isCreateGoalsShown.toggle()
        })
        {
            Image(systemName: "plus.circle")
                .accentColor(Color(.white))
                .imageScale(.large)
                .padding()
        }
    }
    
    
    var body: some View {
        NavigationView{
            
        
            
        VStack{
            
            NavigationLink(destination: QuestionOne(isCreateGoalsActive: self.$isCreateGoalsShown)
                                        .environmentObject( NewGoal()),
                           isActive: self.$isCreateGoalsShown)
            {  EmptyView() }
            .isDetailLink(false)
            
            Spacer().frame(height:10)
            
            
            HStack{
                if retrievedGoals.goals.indices.contains(0){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(retrievedGoals.goals[0].itemUIType)),itemName:retrievedGoals.goals[0].itemDescription)
                        .padding(.leading,10)
                    
                    Spacer().frame(width:10)
                }
                
                
                if retrievedGoals.goals.indices.contains(1){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(retrievedGoals.goals[1].itemUIType)),itemName:retrievedGoals.goals[1].itemDescription)
                        .padding(.trailing,10)
                }
                
            }
                
            Spacer().frame(height:10)
            
            HStack{
                if retrievedGoals.goals.indices.contains(2){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(retrievedGoals.goals[2].itemUIType)),itemName:retrievedGoals.goals[2].itemDescription)
                        .padding(.leading,10)
                    
                    Spacer().frame(width:10)
                }
                
                
                if retrievedGoals.goals.indices.contains(3){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(retrievedGoals.goals[3].itemUIType)),itemName:retrievedGoals.goals[3].itemDescription)
                        .padding(.trailing,10)
                }
            }
            
            Spacer().frame(height:10)
                
          /*  .sheet(isPresented: $isCreateGoalsShown) {
                                createGoals()
                                    .environmentObject(DataService.sharedDataService.createGoal(inContext: self.sharedManagedContext))
                       }*/
        }
        .navigationBarTitle("My Goals",displayMode: .inline)
        .navigationBarItems(trailing: createGoalsButton)
        }.navigationBarColor(backgroundColor: UIColor(named:"pink") ?? .orange, tintColor: .white)
        
        
        
    }
}

struct goalsHome_Previews: PreviewProvider {
    static var previews: some View {
        goalsHomeView()
    }
}
