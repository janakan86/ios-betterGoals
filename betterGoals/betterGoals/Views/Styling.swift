//
//  Styling.swift
//  betterGoals
//
//  Created by K Janakan on 6/7/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

// Text styles
struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .lineSpacing(8)
            .foregroundColor(Color("pink"))
    }
}

struct ContentStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .lineSpacing(4)
            .foregroundColor(Color("greyishBlue"))
    }
}

extension Text {
    func customStyle<Style: ViewModifier>(style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}


// buttons styles


// list style

struct Styling_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
                 Text("Sample text").customStyle(style: TitleStyle())
                 Text("A lot of sample text").customStyle(style: ContentStyle())
        }
   
    }
}
