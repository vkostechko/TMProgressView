//
//  ViewController.swift
//  TMProgressView
//
//  Created by Viachaslau Kastsechka on 2/4/18.
//  Copyright © 2018 Viachaslau Kastsechka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: TMProgressView!

    @IBAction func startAction(_ sender: Any) {
        progressView.start()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        progressView.stop()
    }
    
}

