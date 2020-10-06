//
//  Styling.swift
//  betterGoals
//
//  Created by K Janakan on 6/7/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI
import UIKit

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
            .font(.title2)
            .lineSpacing(8)
            .font(Font.body.bold())
            .foregroundColor(Color(.black))
    }
}

struct Heading2StyleBrown: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .lineSpacing(8)
            .font(Font.body.bold())
            .foregroundColor(Color("lightBrown"))
    }
}

struct NextLinkStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .lineSpacing(8)
            .foregroundColor(.white)
            .padding(.top,5)
            .padding(.bottom,5)
            .padding(.leading,80)
            .padding(.trailing,80)
            .background(Color("pink"))
                .cornerRadius(25)
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

struct ContentStyleBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.body.bold())
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


//navigation bar styling
struct NavigationBarColor: ViewModifier {

  init(backgroundColor: UIColor, tintColor: UIColor) {
    
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = backgroundColor
    
    coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
    
    coloredAppearance.shadowColor = .clear //hides the 1px underline under the bar
                   
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = tintColor
    

  }

  func body(content: Content) -> some View {
    content
  }
}

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}
// End navigation bar styling


struct Styling_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
                 Text("Sample text").customStyle(style: Heading1Style())
                 Text("Next").customStyle(style: NextLinkStyle())
        }
   
    }
}
