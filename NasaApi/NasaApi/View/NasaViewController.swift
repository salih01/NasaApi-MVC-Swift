//
//  NasaViewController.swift
//  NasaApi
//
//  Created by ALFA on 21.10.2022.
//

import UIKit

class NasaViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    // MARK: - Properties
    let networkController = NetworkController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        
        
        
        networkController.photoInfo { (photoInfo) in
            
            guard let photoInfo = photoInfo else {return}
            self.updateUI(with:photoInfo)
            
            DispatchQueue.main.async {
                self.dateTextField.text = photoInfo.date.description
                
            }
            
            

        }
        
    }
    
    // MARK: - Functions
        
    func updateUI(with photoInfo:PhotoInfo) {
        
        networkController.fetchPhotoNow(from: photoInfo.url) { (image) in
            
            //Main queue geçiş yaptık
            DispatchQueue.main.async {
                
                self.imageView.image = image
                self.descriptionLabel.text = photoInfo.explanation
            }
        }
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func buttonDate(_ sender: Any) {
        
        networkController.photoInfo { (photoInfo) in
            
            guard var photoInfo = photoInfo else {return}
            self.updateUI(with:photoInfo)
            
            DispatchQueue.main.async {
                photoInfo.date = self.dateTextField.text!
                
            }
            
        
    }
    

    }
    
}
