//
//  ProjectsView.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
    
    var showProject : [ProjectsData] = []
    
    var body: some View {
        NavigationView {
            List(showProject) { project in
                ProjectCell(project: project)
            }.navigationBarTitle("Проекты")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView(showProject: Pdata)
    }
}

struct ProjectCell: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var project: ProjectsData
    var body: some View {
        return NavigationLink (
        destination: ProjectDetail(project: project.project, description: project.description, numberOfLits: project.numberOfLits, imageName: project.imageName)) {
            HStack {
                Image(project.imageName).resizable()
                    .frame(width: 90.0, height: 90.0)
                VStack(alignment: .leading) {
                    Text(project.project).font(.headline)
                        .padding(.top, -30)
                        .layoutPriority(1)
                    Text(project.description).font(.subheadline)
                        .padding(.top, 2)
                }
                Spacer()
                Spacer()
                Divider()
                VStack {
                    
                    Text("\(project.numberOfLits+tapCount)")
                        .font(.headline).foregroundColor(Color.pink)
                        .fontWeight(.black)
                    HStack{
                        Text("Lit It!")
                    }
                }
            }
        }
    }
}
