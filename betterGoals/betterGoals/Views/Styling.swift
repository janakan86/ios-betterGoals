//
//  Styling.swift
//  betterGoals
//
//  Created by K Janakan on 6/7/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

// Text styles
struct Heading1Style: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .lineSpacing(8)
            .foregroundColor(Color(.black))
    }
}

struct Heading2Style: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .lineSpacing(8)
            .foregroundColor(Color(.gray))
    }
}

struct ContentStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .lineSpacing(4)
            .foregroundColor(Color(.black))
    }
}

struct ContentStylePink: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .lineSpacing(4)
            .foregroundColor(Color("pink"))
    }
}

extension Text {
    func customStyle<Style: ViewModifier>(style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}


// buttons styles
struct navigationButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(Color("pink"))
            .cornerRadius(8.0)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}


// list style

struct Styling_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
                 Text("Sample text").customStyle(style: Heading1Style())
                 Text("A lot of sample text").customStyle(style: ContentStyle())
        }
   
    }
}
