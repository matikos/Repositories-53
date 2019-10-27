//
//  RepositoryRequest.swift
//  Repositories53
//
//  Created by Your Host on 10/23/19.
//  Copyright © 2019 Mati Kos. All rights reserved.
//

import Foundation

enum RepositoryError:Error{
    case noDataAvailable
    case canNotProcessData
}

struct RepositoryRequest {
    let resourceURL:URL
    
    init (repositoryName:String){
        let resourceString = "https://api.github.com/search/repositories?q=\(repositoryName)"
        guard let resourceURL = URL (string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    func getRepositories (completion: @escaping(Result<[RepositoryDetail], RepositoryError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let repositoryResponse = try decoder.decode(RepositoryResponse.self, from: jsonData)
              //  let repositoryDetails = repositoryResponse.response.items
             //   completion(.success(repositoryDetails))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
