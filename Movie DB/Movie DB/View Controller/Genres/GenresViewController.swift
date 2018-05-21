//
//  GenresViewController.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/11/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import UIKit
import MBProgressHUD

class GenresViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let genreDataManager = GenreDataManager()
    var generes: [Genre] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpManager()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// Tableview delegate
extension GenresViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        let movielistViewController = storyBoard.instantiateViewController(withIdentifier: ViewController.movieList) as! MovieListViewController
        movielistViewController.genre = generes[indexPath.row]
        self.navigationController?.pushViewController(movielistViewController, animated: true)
    }

}

extension GenresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.genre, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = generes[indexPath.row].name
//        print(testingArray[indexPath.row])
        return cell
    }
}

extension GenresViewController {
    func setupUI()  {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "TheMovieDB"))
    }

    func setUpManager() {
        OperationQueue.main.addOperation {
            [weak self] in
            guard let strongSelf = self else {
                return
            }
            MBProgressHUD.showAdded(to: strongSelf.view, animated: true)
            
            strongSelf.genreDataManager.getGenres(onComplete: { (cars: [Genre]?, message: String, success: Bool) -> () in
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
                if success {
                    strongSelf.generes = cars ?? []
                    strongSelf.tableView.reloadData()
                    strongSelf.tableView.isHidden = false
                } else {
                    strongSelf.showOKAlert(title: ErrorMessages.errorTitle, message: message)
                }
            })
        }
        
    }
}
