//
//  resultViewController.swift
//  SlideshowApp
//
//  Created by 田尾　早和美 on 2021/04/17.
//

import UIKit

class resultViewController: UIViewController {
    var result_image:UIImage!
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultImageView.image=result_image
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
