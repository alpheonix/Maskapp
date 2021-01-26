//
//  ViewController.swift
//  VideoStream
//
//  Created by Arthur BLANC on 15/12/2020.
//  Copyright © 2020 Arthur BLANC. All rights reserved.
//

import UIKit
import MJPEGStreamLib

class ViewController: UIViewController {

   @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var pictureBtn: UIImageView!
    
    @IBOutlet var validationImage: UIImageView!
    var stream: MJPEGStreamLib!
    var url: URL?
    var maskService: Service {
           return Service()
       }
    

    override func viewDidLoad() {
    super.viewDidLoad()
        
        self.loadingIndicator.isHidden = false
        //je suis un test du git
        self.imageView.transform = CGAffineTransform(rotationAngle: (90.0 * .pi) / 180.0)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        pictureBtn.isUserInteractionEnabled = true
        pictureBtn.addGestureRecognizer(tapGestureRecognizer)
        //imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        // Set the ImageView to the stream object
        stream = MJPEGStreamLib(imageView: imageView)
        // Start Loading Indicator
        stream.didStartLoading = { [unowned self] in
        self.loadingIndicator.startAnimating()
    }
        // Stop Loading Indicator
        stream.didFinishLoading = { [unowned self] in
        self.loadingIndicator.stopAnimating()
            self.loadingIndicator.isHidden = true
    }

        // Your stream url should be here !
        let url = URL(string: "http://192.168.1.97:8000/stream.mjpeg")
        stream.contentURL = url

        stream.play() // Play the stream
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Make the Status Bar Light/Dark Content for this View
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.validationImage.isHidden = true
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print ("test")
        maskService.screen { (mask) in
            self.validationImage.isHidden = false

            if(mask == 1) {
                
                self.validationImage.image = UIImage(named: "validate")
                let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                    self.validationImage.isHidden = true
                }
            }else if(mask == 0){
                self.validationImage.image = UIImage(named: "denied")
                _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                    self.validationImage.isHidden = true
                }
            }
            
        }
        print("yy")
        
    }
    @IBAction func statButton(_ sender: Any) {
        
    }
    
}

