//
//  SingleUserView.swift
//  iTinder4.0
//
//  Created by алтынпончик on 5/29/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct SingleUserView: View {
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct SingleUserView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        SingleUserView(astronaut: astronauts[0])
    }
}
