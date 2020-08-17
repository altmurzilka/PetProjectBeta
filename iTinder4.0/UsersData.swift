//
//  UsersData.swift
//  iTinder4.0
//
//  Created by Алтын on 8/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class User: ObservableObject {
    @Published var email = ""
    @Published var pass = ""
    @Published var status: Bool {
        didSet {
            UserDefaults.standard.set(status, forKey: "status")
        }
    }
    init() {
        self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    }
}
