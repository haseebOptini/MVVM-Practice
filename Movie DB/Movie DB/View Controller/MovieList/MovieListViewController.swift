//
//  MovieListViewController.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/12/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import UIKit
import MBProgressHUD

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let  movieListDataManager = MovieListDataSource()
    var movies: [Movie] = []
    var genre: Genre!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
        
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAt: indexPath)
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.movie, for: indexPath) as! MovieOverViewTableViewCell
        cell.selectionStyle = .none
        let movie = movies[indexPath.row]
        cell.configCell(movie: movie)
        return cell
    }
}

extension MovieListViewController {
    private func setupUI()  {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        self.navigationItem.title = self.genre.name
    }
    
   private func setUpManager() {
        OperationQueue.main.addOperation {
            [weak self] in
            guard let strongSelf = self else {
                return
            }
            MBProgressHUD.showAdded(to: strongSelf.view, animated: true)
            
            strongSelf.movieListDataManager.getMovieList(genreId: strongSelf.genre.id, onComplete: { (movies: [Movie]?, message: String, success: Bool) -> () in
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
                if success {
                    strongSelf.movies = movies ?? []
                    strongSelf.tableView.reloadData()
                    strongSelf.tableView.isHidden = false
                } else {
                    strongSelf.showOKAlert(title: ErrorMessages.errorTitle, message: message)
                }
            })
        }
        
    }
    
    fileprivate func setupViewController() {
        setupUI()
        setUpManager()
    }
}
