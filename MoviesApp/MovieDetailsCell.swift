//
//  MovieDetailsCell.swift
//  MoviesApp
//
//  Created by mohamed gamal mohamed on 5/31/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit

class MovieDetailsCell: UITableViewCell {

    enum DetailsType{
        case title
        case year
        case imdbID
    }
    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func recieveMovieInfo (type : DetailsType , text: String?)
    {
        switch type {
        
        case .title:
            lbl.text = "Movie Title : \(text ?? "")"
        case .year:
            lbl.text = "Year : \(text ?? "")"

        case .imdbID:
            lbl.text = "IMDB ID : \(text ?? "")"
        }
    }

}
class MovieImageCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    
}

