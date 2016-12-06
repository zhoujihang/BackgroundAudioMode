//
//  ViewController.swift
//  BackgroundModeDemo
//
//  Created by 周际航 on 2016/12/5.
//  Copyright © 2016年 com.maramara. All rights reserved.
//

import UIKit
import AVFoundation

let kBackgroundAudioAutoPlayOpenString = "后台自动播放音乐 - 开启"
let kBackgroundAudioAutoPlayCloseString = "后台自动播放音乐 - 关闭"

class ViewController: UIViewController {
    
    let backgroundModeBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundModeBtn.setTitle(kBackgroundAudioAutoPlayOpenString, for: .normal)
        self.backgroundModeBtn.setTitleColor(UIColor.black, for: .normal)
        self.backgroundModeBtn.addTarget(self, action: #selector(backgroundModeBtnDidClick), for: .touchUpInside)
        self.backgroundModeBtn.backgroundColor = UIColor.cyan
        self.view.addSubview(self.backgroundModeBtn)
        
        AudioManager.shared.openBackgroundAudioAutoPlay = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.backgroundModeBtn.sizeToFit()
        self.backgroundModeBtn.center = self.view.center
    }
    func backgroundModeBtnDidClick() {
        guard let title = self.backgroundModeBtn.title(for: .normal) else {return}
        
        if title == kBackgroundAudioAutoPlayOpenString {
            AudioManager.shared.openBackgroundAudioAutoPlay = true
            self.backgroundModeBtn.setTitle(kBackgroundAudioAutoPlayCloseString, for: .normal)
        } else {
            AudioManager.shared.openBackgroundAudioAutoPlay = false
            self.backgroundModeBtn.setTitle(kBackgroundAudioAutoPlayOpenString, for: .normal)
        }
    }
    
    func didBecomeActive() {
        debugPrint("\(type(of:self)): 11111")
    }
    
}

