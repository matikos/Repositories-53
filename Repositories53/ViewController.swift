//
//  ViewController.swift
//  Repositories53
//
//  Created by Your Host on 10/23/19.
//  Copyright © 2019 Mati Kos. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfRepositories = [RepositoryDetail]() {
    didSet {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.navigationItem.title = "\(self.listOfRepositories.count) Repositories found!"
        }
    }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfRepositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let repository = listOfRepositories[indexPath.row]
        cell.textLabel?.text = repository.name
        cell.detailTextLabel?.text = repository.language
        
        
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }


}
extension ViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print("Hello, World.")
        guard let searchBarText = searchBar.text else {return}
        let repositoryRequest = RepositoryRequest(repositoryName: searchBarText)
        repositoryRequest.getRepositories { [weak self] result in
            switch result{
            case .failure(let error):
                print(error)
                print("Hello, Line 57.")
            case .success(let repositories):
                self?.listOfRepositories = repositories
                print("Hello, Line 60.")
            }
        }
    }
}
