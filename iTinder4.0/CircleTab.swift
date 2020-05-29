//
//  CircleTab.swift
//  iTinder4.0
//
//  Created by алтынпончик on 5/29/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct Tab: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 20, height: 20)
            .scaledToFit()
            .foregroundColor(.white)
            .padding()
            .background(Color("Color"))
            .clipShape(Circle())
            .offset(y: -20)
            .padding(.bottom, -20)
    }
}

struct CircleTab: View {
    @Binding var index : Int
    var body: some View {
        HStack {
            Button (action: {
                
                self.index = 0
                
            }) {
                VStack {
                    if self.index != 0 {
                        Image(systemName: "list.bullet").foregroundColor(Color.black.opacity(0.2))
                    }
                    else {
                        Image(systemName: "list.bullet")
                            .modifier(Tab())
                        
                        Text("События").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            
            Spacer(minLength: 15)
            
            Button (action: {
                self.index = 1
            }) {
                VStack {
                    if self.index != 1 {
                        Image(systemName: "square.and.pencil").foregroundColor(Color.black.opacity(0.2))
                    }
                    else {
                        Image(systemName: "square.and.pencil")
                            .modifier(Tab())
                        
                        Text("Проекты").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            
            Spacer(minLength: 15)
            
            Button (action: {
                self.index = 2
            }) {
                VStack {
                    if self.index != 2 {
                        Image(systemName: "person.3").foregroundColor(Color.black.opacity(0.2))
                    }
                    else {
                        Image(systemName: "person.3")
                            .modifier(Tab())
                        
                        Text("Команды").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            
            Spacer(minLength: 15)
            
            Button (action: {
                self.index = 3
            }) {
                VStack {
                    if self.index != 3 {
                        Image(systemName: "person").foregroundColor(Color.black.opacity(0.2))
                    }
                    else {
                        Image(systemName: "person")
                            .modifier(Tab())
                        
                        Text("Профиль").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
        }.padding(.vertical, -10)
            .padding(.horizontal, 25)
            .background(Color.white)
            .animation(.spring())
    }
}
