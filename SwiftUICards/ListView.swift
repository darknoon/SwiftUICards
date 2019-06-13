//
//  ContentView.swift
//  SwiftUICards
//
//  Created by Andrew Pouliot on 6/12/19.
//  Copyright © 2019 Andrew Pouliot. All rights reserved.
//

import SwiftUI

struct ListView : View {
    var body: some View {
        List(0 ..< 5) { item in
            ListCard()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ListView()
        
    }
}
#endif
