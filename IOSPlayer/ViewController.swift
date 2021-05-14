//
//  ViewController.swift
//  IOSPlayer
//
//  Created by Software Engineering on 14/05/2021.
//  Copyright © 2021 Software Engineering. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

//call to func to play the audio
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func soundFiles() {
        let bundle = Bundle.main

        guard let sound = bundle.path(forResource: "suga_boom_boom", ofType: "mp3")
                else
        {
            return
        }; do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            print("song found")
        } catch {
            print("Song not found")
        }
    }

    @IBAction func audioPlayer(_ sender: UIButton) {
        //fetch the song
        soundFiles()
        //play the sound
        audioPlayer.play()
    }
}
