//
//  TeamDetail.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct TeamDetail: View {
    
    @ObservedObject private var user = User()
    
    @State private var showingAlert = false
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var team: String
    var motto: String
    var description: String
    var numberOfParticipants: Int
    var imageName: String
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottomTrailing) {
                
                Image(imageName)
            }
            HStack {
                Text(motto)
                Text("\(numberOfParticipants)")
            }
            Text(description).padding()
            
            Button(action: {
                self.buttonTapped()
                self.showingAlert = true
            }) {
                Text("Join!")
            }
            .font(.headline)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("ОК")))
            }
            
            Spacer()
        }.padding()
            .navigationBarTitle(Text(team), displayMode: .inline)
    }
    
    func buttonTapped() {
        if user.status == true {
            alertTitle = "Успех!"
            alertMessage = "Ваша заявка была отправлена!"
        } else {
            alertTitle = "Стоп!"
            alertMessage = "Сначала регистрация!"
        }
    }
}

struct TeamDetail_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetail(team: "DobroTeam", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 5, imageName: "image-alignment")
    }
}
