//
//  Repositories.swift
//  Repositories53
//
//  Created by Your Host on 10/23/19.
//  Copyright © 2019 Mati Kos. All rights reserved.
//

import Foundation

//struct RepositoryResponse:Decodable {
//    var response:Repositories
//}

struct RepositoryResponse:Decodable {
    var items: [RepositoryDetail]!
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.items = try container.decode([RepositoryDetail].self, forKey: .items)
        } catch {
            print(error)
        }
    }
}

struct RepositoryDetail:Decodable {
    var name:String?
    var author:Author?
    var language:String?
    var forks:Int?
    var open_issues:Int?
    var score:Int?
    
    enum CodingKeys: String, CodingKey {
        case name,author,language,forks,open_issues,score
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String?.self, forKey: .name)
          //  self.author = try container.decode(Author?.self, forKey: .author)
            self.language = try container.decode(String?.self, forKey: .language)
            self.forks = try container.decode(Int?.self, forKey: .forks)
            self.open_issues = try container.decode(Int?.self, forKey: .open_issues)
            self.score = try container.decode(Int?.self, forKey: .score)
        } catch {
            print(error)
        }
    }
}

struct Author:Decodable {
    var login:String
}
