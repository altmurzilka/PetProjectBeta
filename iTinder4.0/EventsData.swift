//
//  EventsData.swift
//  iTinder4.0
//
//  Created by алтынпончик on 5/19/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct EventsData: Identifiable {
    let id = UUID()
    let event: String
    let shortDescription: String
    let description: String
    let tag: String
    var imageName: String
}

let Edata = [
    EventsData(event: "Hack Day", shortDescription: "Some OLOLO in th e ololo heading ololo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "hackathon", imageName: "swiftui-button"),
    EventsData(event: "Demo Day", shortDescription: "Some OLOLO in th e ololo heading ololo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "hackathon", imageName: "swiftui-button"),
    EventsData(event: "SwiftBySundell", shortDescription: "Some OLOLO in th e ololo heading ololo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "talk", imageName: "swiftui-button"),
    EventsData(event: "TechGarden", shortDescription: "Some OLOLO in th e ololo heading ololo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "hackathon", imageName: "swiftui-button"),
    EventsData(event: "Hackday2047", shortDescription: "Some OLOLO in th e ololo heading ololo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "meetup", imageName: "swiftui-button"),
    EventsData(event: "Hackday2020", shortDescription: "Some OLOLO in th e ololo heading ololo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "it", imageName: "swiftui-button"),
    EventsData(event: "Hackday2028", shortDescription: "Some OLOLO in th e ololo heading ololo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et faucibus lectus. Phasellus dapibus nunc a arcu feugiat, ut euismod enim lobortis. Integer sed odio felis.", tag: "hackathon", imageName: "swiftui-button")
]
