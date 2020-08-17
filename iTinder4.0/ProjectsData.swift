//
//  ProjectsData.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ProjectsData: Identifiable {
    let id = UUID()
    let project: String
    let description: String
    let numberOfLits: Int
    let imageName: String
}

let Pdata = [
    ProjectsData(project: "DobroTeam", description: "Integer sed odio felis.", numberOfLits: 23, imageName: "hackday"),
    ProjectsData(project: "SomePRJCT", description: "Integer sed odio felis.", numberOfLits: 0, imageName: "flame"),
    ProjectsData(project: "Robo", description: "Integer sed odio felis.", numberOfLits: 12, imageName: "hackday"),
    ProjectsData(project: "iTinder", description: "Integer sed odio felis.", numberOfLits: 74, imageName: "itinder"),
    ProjectsData(project: "SlimShady", description: "Integer sed odio felis.", numberOfLits: 6, imageName: "flame")
]
