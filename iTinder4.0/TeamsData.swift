//
//  TeamsData.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct TeamsData: Identifiable {
    let id = UUID()
    let team: String
    let motto: String
    let description: String
    let numberOfParticipants: Int
    let imageName: String
}

class Teams: ObservableObject {
    @Published var items = [TeamsData]()
}

var Tdata = [
    TeamsData(team: "DobroTeam", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 5, imageName: "image-alignment"),
    TeamsData(team: "Revolv", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 3, imageName: "image-alignment"),
    TeamsData(team: "8base", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 3, imageName: "image-alignment"),
    TeamsData(team: "Snack", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 5, imageName: "image-alignment"),
    TeamsData(team: "Altar", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 3, imageName: "image-alignment"),
    TeamsData(team: "Kunster", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 1, imageName: "image-alignment"),
    TeamsData(team: "Ololo", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 3, imageName: "image-alignment"),
    TeamsData(team: "Haikyuu", motto: "alea jacta est", description: "Integer sed odio felis.", numberOfParticipants: 3, imageName: "image-alignment")
]
