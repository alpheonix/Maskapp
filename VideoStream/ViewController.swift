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

    var stream: MJPEGStreamLib!
    var url: URL?

    override func viewDidLoad() {
    super.viewDidLoad()

        // Set the ImageView to the stream object
        stream = MJPEGStreamLib(imageView: imageView)
        // Start Loading Indicator
        stream.didStartLoading = { [unowned self] in
        self.loadingIndicator.startAnimating()
    }
        // Stop Loading Indicator
        stream.didFinishLoading = { [unowned self] in
        self.loadingIndicator.stopAnimating()
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
}

