//
//  EventDetail.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct EventDetail: View {
    
    @ObservedObject private var user = User()
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var event: String
    var shortDescription: String
    var description: String
    var tag: String
    var imageName: String
    
    var body: some View {
        VStack {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Divider().padding()
            
            VStack(alignment: .trailing, spacing: 20) {
                
                Text(description)
                
                Button(action: {
                    self.buttonTapped()
                    self.showingAlert = true
                }) {
                    Text("Хочу сюда!")
                }.font(.headline)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            
            Spacer()
            
        }.padding()
            .navigationBarTitle(Text(event), displayMode: .inline)
    }
    
    func buttonTapped() {
        if user.status == true {
            alertTitle = "Успех!"
            alertMessage = "Вы зарегистрировались на данное мероприятие!"
        } else {
            alertTitle = "Стоп!"
            alertMessage = "Сначала регистрация!"
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: "Hack Day", shortDescription: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "hackathon", imageName: "swiftui-button")
    }
}
