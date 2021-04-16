//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田尾　早和美 on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var autoButton: UIButton!
    @IBAction func tapImage(_ sender: AnyObject) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    
    
    var timer: Timer!
    var timer_sec: Float = 0
    var image_count = ["0.jpg","1.jpg","2.jpeg"]
    var i: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初期画像を設定
        imageView.image = UIImage(named:"0.jpg")
        autoButton.setTitle("再生", for: .normal)
        
        
    }
    //画面遷移先に画像の情報を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:resultViewController = segue.destination as! resultViewController
        resultViewController.result_image = UIImage(named:String(image_count[i]))
        
    }
    //Timerを更新していき、更新のたびにimageViewに値を反映
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        i = i+1
        if i > 2 {
            i = 0
        }
        imageView.image = UIImage(named:String(image_count[i]))
            
        }
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        i = i-1
        if i < 0 {
            i = 2
        }
        imageView.image = UIImage(named:String(image_count[i]))
        
    }
    //進むボタン
    @IBAction func goButton(_ sender: Any) {
        i = i+1
        if i > 2 {
            i = 0
        }
        imageView.image = UIImage(named:String(image_count[i]))
    }
    //再生/停止ボタン
    @IBAction func AutoButton(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            autoButton.setTitle("停止", for: .normal)
            backButton.isEnabled = false
            goButton.isEnabled = false
            
        
        }
        else {
            
            self.timer.invalidate()
            self.timer = nil
            autoButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            goButton.isEnabled = true
            
            
            
            
        }
        
        
    }
    //遷移先から戻るボタン用
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }

}

