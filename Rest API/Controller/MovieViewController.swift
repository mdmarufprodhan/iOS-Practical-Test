//
//  ViewController.swift
//  Movie Search
//
//  Created by Md Maruf Prodhan on 30/10/21.

//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var serachBarController : UISearchController!
    
    private var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPopularMoviesData()
    }
    
    private func loadPopularMoviesData() {
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
}

// MARK: - TableView
extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
    }
}
