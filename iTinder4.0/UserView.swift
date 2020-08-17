//
//  UserView.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct UserView: View {
    //@Binding var status : Bool
    var body: some View {
        VStack {
            Image("itinder")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Hello!")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
