//
//  ProjectDetail.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ProjectDetail: View {
    
    @ObservedObject private var user = User()
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var userVote = 1
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @State private var showingAlert = false
   // @State private var currentScore = 0
    
    var project: String
    var description: String
    var numberOfLits: Int
    var imageName: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                
                Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
            Text(description).padding()
            
            Button(action: {
                self.buttonTapped()
                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            }) {
                Text("\(numberOfLits+tapCount) Lit It!")
            }.font(.headline)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }.padding()
            .navigationBarTitle(Text(project), displayMode: .inline)
    }
    
    func buttonTapped() {
        if user.status == true {
            self.showingAlert = false
            self.tapCount += 1
        } else {
            self.showingAlert = true
            alertTitle = "Стоп!"
            alertMessage = "Сначала регистрация!"
        }
    }
}

struct ProjectDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetail(project: "Hack Day", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", numberOfLits: 5, imageName: "hackday")
    }
}
