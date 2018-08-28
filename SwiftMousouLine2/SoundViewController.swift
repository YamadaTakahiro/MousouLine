//
//  SoundViewController.swift
//  SwiftMousouLine2
//
//  Created by Yamada Takahiro on 2018/08/28.
//  Copyright © 2018年 taka. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView2.isHidden = true
        timeLabel.isHidden = true
        
        //音声の再生
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch {
                // プレイヤー作成失敗
                // その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
            
        } else {
            // urlがnilなので再生できない
            fatalError("Url is nil.")
        }

        
        
        
    }

    
    @IBAction func tap(_ sender: Any) {
        
        imageView2.isHidden = false
        timeLabel.isHidden = false

        
        //タイマーをスタート
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timercountUp), userInfo: nil, repeats: true)
        
//        timeLabel.text = String(count)
        //音声再生
       playBabySound()

        
    }
    
    
    func playBabySound(){
        
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch {
                // プレイヤー作成失敗
                // その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
            
        } else {
            // urlがnilなので再生できない
            fatalError("Url is nil.")
        }
        
        
    }
    
    @objc func timercountUp(){
        
        count = count + 1
        timeLabel.text = String(count)

        
    }
    
    @IBAction func deny(_ sender: Any) {
        
        //電話を切る
        
        //音声のストップ
        audioPlayer.stop()
        
        //画面を戻す
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}
