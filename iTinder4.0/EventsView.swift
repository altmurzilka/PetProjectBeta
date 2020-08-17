//
//  EventsView.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct EventsView: View {
    
    var showEvent: [EventsData] = []
    
    var body: some View {
        NavigationView {
            List(showEvent) { event in
                EventCell(event: event)
            }.navigationBarTitle("События")
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(showEvent: Edata)
    }
}

struct EventCell: View {
    let event: EventsData
    var body: some View {
        return NavigationLink(
        destination: EventDetail(event: event.event, shortDescription: event.shortDescription, description: event.description, tag: event.tag, imageName: event.imageName)) {
            VStack {
                Image(event.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack {
                    VStack(alignment: .leading) {
                        Text(event.tag.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(event.event)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
//                        Text(event.tag.uppercased())
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    Spacer()
                }.padding()
            }
            }.padding(.trailing, -32.0)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
               .stroke(Color(.sRGB, red: 103/255, green: 192/255, blue: 174/255, opacity: 0.8), lineWidth: 1))
    }
}
