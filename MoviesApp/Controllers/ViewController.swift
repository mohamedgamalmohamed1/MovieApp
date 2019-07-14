//
//  ViewController.swift
//  MoviesApp
//
//  Created by mohamed gamal mohamed on 5/31/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var myLoading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    func loadData(){
        let Parameters : [String:String] = ["s":"Beautiful Mind" , "apiKey":"b52fc4a5"]
        myLoading.startAnimating()
        
        Alamofire.request("http://www.omdbapi.com", method: .get, parameters: Parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (myResponse) in
            
            self.myLoading.stopAnimating()
            do {
                let searchResults = try JSONDecoder().decode(SearchResults.self, from: myResponse.data!)
                if let movies = searchResults.Search{
                self.movies = movies
                    self.tableView.reloadData()
                }
            }catch let error{
                print("ERROR : \(error)")
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")
        as! MovieCell
        cell.lbl.text = movie.Title
        return cell 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let view = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        view.movie = movie
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count 
    }

}

