//
//  TeamsView.swift
//  iTinder4.0
//
//  Created by алтынпончик on 5/29/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct TeamsView: View {
    @ObservedObject var team = Teams()
    
    var showTeam : [TeamsData] = []
    
    var body: some View {
        NavigationView {
            List(showTeam) { team in
                TeamCell(team: team)
            }.navigationBarTitle("Команды")
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView(showTeam: Tdata)
    }
}

struct TeamCell: View {
    var team: TeamsData
    var body: some View {
        return NavigationLink(
            destination: TeamDetail(team: team.team, motto: team.motto, description: team.description, numberOfParticipants: team.numberOfParticipants, imageName: team.imageName)) {
            HStack {
                HStack {
                    Image(team.imageName).resizable()
                        .frame(width: 90.0, height: 90.0)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    VStack(alignment: .leading) {
                        Text(team.team).font(.headline)
                            
                            .layoutPriority(1)
                        Text(team.motto).font(.subheadline)
                            .padding(.top, 3)
                        Spacer()
                        
                        HStack {
                            Image(systemName: "person")
                            Text("\(team.numberOfParticipants)")
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Button ("Join!")  {
                        
                    }.padding()
                    .clipShape(Circle())
                }
            }
        }
    }
}
