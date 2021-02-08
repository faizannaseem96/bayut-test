//
//  Environment.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import Foundation

class Environment {
    
    static var baseServer = NetworkEnvironment.serverWithName(name: "Dev")
    static var baseURL = baseServer.urlString
}
