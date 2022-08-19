//
//  ViewController.swift
//  ContactListApp
//
//  Created by Александр Матукин on 18.08.2022.
//

import UIKit
import AlamofireImage

class DetailContactViewController: UIViewController {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    var result: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues(with: result)
    }
    
    override func viewWillLayoutSubviews() {
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
    }
    
    private func setValues(with user: User) {
        firstNameLabel.text = result.name?.first
        lastNameLabel.text = result.name?.last
        
        guard let imageURL = URL(string: user.picture?.large ?? "") else { return }
        userImageView.af.setImage(withURL: imageURL)
        
    }
}

