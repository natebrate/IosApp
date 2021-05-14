//
//  ViewController.swift
//  IOSPlayer
//
//  Created by Software Engineering on 14/05/2021.
//  Copyright © 2021 Software Engineering. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
//call to func to play the audio
    //var audioPlayer = AVAudioPlayer()
   var audioPlayer: AVAudioPlayer!

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
            pauseBtn.isEnabled = false
            stopBtn.isEnabled = false
            audioPlayer.delegate = self
            print("song found")
        } catch {
            print("Song not found")
        }
        audioPlayer.enableRate = true
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        //This changes the text in the label.
        speedLabel.text = String(format: "Speed: %.2f", slider.value)
        //This changes the rate or speed the audio should be played at.
        audioPlayer.rate = slider.value
    }
    
    
    @IBAction func audioPlayer(_ sender: UIButton) {
        //fetch the song
        soundFiles()
        //play the sound
        audioPlayer.play()
        playBtn.isEnabled = false
        
        if !pauseBtn.isEnabled {
            pauseBtn.isEnabled = true
        }
        
        if !stopBtn.isEnabled {
            stopBtn.isEnabled = true
        }
    }
    
    
    @IBAction func pauseBtn(_ sender: UIButton) {
        
        if audioPlayer.isPlaying == true {
            audioPlayer.stop()
            pauseBtn.isEnabled = false
            playBtn.isEnabled = true
        }
    }
    
    
    @IBAction func stopBtn(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        pauseBtn.isEnabled = true
        playBtn.isEnabled = false
        stopBtn.isEnabled = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        pauseBtn.isEnabled = true
        playBtn.isEnabled = false
        stopBtn.isEnabled = false
    }
       
}
