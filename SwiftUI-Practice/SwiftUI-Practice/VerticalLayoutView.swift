//
//  VertiaclView.swift
//  SwiftUI-Practice
//
//  Created by shin kim on 2021/03/14.
//

import SwiftUI

struct VerticalLayoutView : View {
    var body: some View {
        // Vertical Layout
        VStack {
            Text("1")
            Text("2")
            Text("3")
            Text("4")
        }
    }
    
    struct VerticalLayoutView_Previews: PreviewProvider {
        static var previews: some View {
            VerticalLayoutView()
        }
    }
}
