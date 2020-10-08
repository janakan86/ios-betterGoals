//
//  KeyboardInformation.swift
//  betterGoals
//
//  Created by K Janakan on 7/10/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI
import Combine

final class KeyboardInformation: ObservableObject {
    
    @Published private(set) var keyboardHeight: CGFloat = 0
    
    private var cancellable: AnyCancellable?
    
 
    
    
    private let keyboardWillShowPublisher = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap{($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height}
    
    
    private let keyboardWillHidePublisher = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .compactMap{ _ in CGFloat.zero}
    
    
    init(){
        
          cancellable =   Publishers.Merge(keyboardWillShowPublisher,keyboardWillHidePublisher)
            .subscribe(on:DispatchQueue.main)
            .assign(to:\.self.keyboardHeight,on:self)
    }
    
    
}




struct hideIfKeyBoardIsPresentModifer : ViewModifier {
    
    @StateObject private var keyboardInformation = KeyboardInformation()
    
    func body(content: Content) -> some View {
        
        Group {
            if keyboardInformation.keyboardHeight.isZero {
               content
            } else {
                //content.hidden().animation(.easeOut(duration: 0.15))
            }
        }
    }
}

struct moveContentUpIfKeyboardPresentModifier : ViewModifier {
    
    @StateObject private var keyboardInformation = KeyboardInformation()
    var verticalOffset:CGFloat = 0
    
    
    func body(content: Content) -> some View {
        
        Group {
            if keyboardInformation.keyboardHeight.isZero {
               content
            } else {
                content.offset(y: -(verticalOffset))
            }
        }
    }
}

extension View {
    func hideIfKeyBoardIsPresent() -> some View {
        self.modifier(hideIfKeyBoardIsPresentModifer())
    }
    
    func moveContentUpIfKeyboardPresent(offset:CGFloat) -> some View {
        self.modifier(moveContentUpIfKeyboardPresentModifier(verticalOffset:offset))
    }
}
