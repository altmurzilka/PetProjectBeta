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
                    EventsView(showEvent: Edata)
                }
                else if self.index == 1{
                    ProjectsView(showProject: Pdata)
                }
                else if self.index == 2{
                    TeamsView(showTeam: Tdata)
                }
                else{
                    RegistrationView()
                }
            }
            CircleTab(index: self.$index)
        }//.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
