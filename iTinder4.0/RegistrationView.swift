//
//  RegistrationView.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI
import Foundation
import Combine
import Firebase

struct RegistrationView: View {
    var body: some View {
        Home()
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


struct Home: View {
    
    @State private var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        NavigationView {
            VStack {
                if self.status{
                    Homescreen()
                }
                else{
                    ZStack{
                        
                        NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                            
                            Text("")
                        }
                        .hidden()
                        
                        Login(show: self.$show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) {
                    (_) in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct Homescreen : View {
    
    var body: some View{
        VStack{
            
            Text("Вход произведен!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            
            //  UserView()
            Button(action: {
                
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                
                Text("Выйти")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top, 25)
        }
    }
}


struct Login: View {
    
    @ObservedObject private var user = User()
    
    @State private var color = Color.black.opacity(0.5)
    @State private var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader {_ in
                    VStack {
                        Image("itinder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color("Color"))
                        Text("Войти в учетную запись")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$user.email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.user.email != "" ? Color("Color") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    TextField("Пароль", text: self.$user.pass)
                                        .autocapitalization(.none)
                                } else{
                                    SecureField("Пароль", text: self.$user.pass)
                                        .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                self.visible.toggle()
                                
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.user.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack {
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                Text("Регистрация")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.reset()
                                
                            }) {
                                Text("Не помню пароль")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top, 20)
                        
                        Button( action: {
                            
                            self.verify()
                            
                        }) {
                            Text("Войти")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func verify(){

        if self.user.email != "" && self.user.pass != ""{

            Auth.auth().signIn(withEmail: self.user.email, password: self.user.pass) { (res, err) in

                if err != nil{

                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                print("success")
                self.user.status.toggle()
                print("val for user Log \(self.user.status)")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
        else{

            self.error = "Пожалуйста, заполните все поля"
            self.alert.toggle()
        }
    }
    
    func reset(){

        if self.user.email != ""{

            Auth.auth().sendPasswordReset(withEmail: self.user.email) { (err) in

                if err != nil{

                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }

                self.error = "RESET"
                self.alert.toggle()
            }
        }
        else{

            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }
}

struct SignUp: View {
    
    @State private var color = Color.black.opacity(0.7)
    @State private var email = ""
    @State private var pass = ""
    @State private var repass = ""
    @State private var visible = false
    @State private var revisible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                GeometryReader {_ in
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color("Color"))
                        Text("Войти в учетную запись")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    TextField("Пароль", text: self.$pass)
                                        .autocapitalization(.none)
                                } else{
                                    SecureField("Пароль", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                self.visible.toggle()
                                
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.revisible {
                                    TextField("Повторите пароль", text: self.$repass)
                                        .autocapitalization(.none)
                                } else{
                                    SecureField("Повторите пароль", text: self.$repass)
                                        .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                self.revisible.toggle()
                                
                            }) {
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        Button( action: {
                            
                            self.register()
                            
                        }) {
                            Text("Регистрация")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            
            if self.alert{
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func register(){

        if self.email != ""{

            if self.pass == self.repass{

                Auth.auth().createUser(withEmail: self.email, password: self.pass) { (res, err) in

                    if err != nil{

                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }

                    print("success")

                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
            else{

                self.error = "Password mismatch"
                self.alert.toggle()
            }
        }
        else{

            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
}

struct ErrorView: View {
    
    @State private var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        
        GeometryReader{_ in
            
            VStack{
                
                HStack {
                    Text(self.error == "RESET" ? "Message" : "Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    
                    self.alert.toggle()
                    
                }) {
                    Text(self.error == "RESET" ? "Ok" : "Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
