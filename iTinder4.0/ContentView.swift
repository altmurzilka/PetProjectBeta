//
//  ContentView.swift
//  iTinder4.0
//
//  Created by алтынпончик on 5/17/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                
                if self.index == 0{
                    
                    Color.black.opacity(0.05)
                }
                else if self.index == 1{
                    
                    Color.yellow
                }
                else if self.index == 2{
                    
                    Color.blue
                }
                else{
                    
                    Color.orange
                }
            }
            CircleTab(index: self.$index)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
