//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by mohamed gamal mohamed on 5/31/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    var movie = Movie()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        print("i recieved anew movie \n \n \n \(movie)")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0 ){
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieImageCell") as! MovieImageCell
            cell.img.kf.indicatorType = .activity

            let url = URL(string: movie.Poster!)
            cell.img.kf.setImage(with: url)

            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailsCell") as! MovieDetailsCell
            if (indexPath.row == 1){
                cell.recieveMovieInfo(type: .title, text: movie.Title)
            }else if (indexPath.row == 2){
                cell.recieveMovieInfo(type: .year, text: movie.Year)
            }else if (indexPath.row == 3){
                cell.recieveMovieInfo(type: .imdbID, text: movie.imdbID)
                
            }
            
            return cell
           
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0){
            return 350
        }
        else {
            return UITableView.automaticDimension
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
