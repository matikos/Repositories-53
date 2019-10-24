//
//  Repositories.swift
//  Repositories53
//
//  Created by Your Host on 10/23/19.
//  Copyright © 2019 Mati Kos. All rights reserved.
//

import Foundation

struct RepositoryResponse:Decodable {
    var response:Repositories
}
struct Repositories:Decodable {
    var items:[RepositoryDetail]
}

struct RepositoryDetail:Decodable {
    var name:String
    var author:Author
    var language:String
    var forks:Int
    var open_issues:Int
    var score:Int
}

struct Author:Decodable {
    var login:String
}
