//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Shousei  Murakami on 2020/07/15.
//  Copyright © 2020 shousei.murakami2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SlideImage: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
   
    // タイマーを格納するプロパティ変数timerを宣言
    var timer: Timer!

    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // 表示している画像の番号
    var displayImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = ["IMG_8765.png", "IMG_8766.png", "IMG_8767.png", "IMG_8768.png", "IMG_8769.png"]

    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        SlideImage.image = image
    }
    
     override func viewDidLoad() {
         super.viewDidLoad()
    // 初期画面
     }

     // selector: #selector(displayImage()) で指定された関数
     // timeInterval: 2.0, repeats: true で指定された通り、2.0秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer){
        // 進むボタンの内容を行う
        if displayImageNo < imageNameArray.count - 1 {
                  // 表示している画像の番号を1増やす
            displayImageNo += 1
                  // 表示している画像の番号を元に画像を表示する
            displayImage()
              } else {
                  displayImageNo = 0
                  displayImage()
              }
     }
    
    // 進むボタン IBAction
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    // 戻るボタン IBAction
    @IBAction func backButtonTap(_ sender: Any) {
        if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
            // 表示している画像の番号を1減らす
            displayImageNo -= 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }  else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    
    // 再生/停止ボタン IBAction
    @IBAction func witchButtonTap(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
                if self.timer == nil {
                    // タイマーの作成、始動
                    self.timer = Timer.scheduledTimer(timeInterval: 2.0,target: self,
                                    selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                    
                    // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                    nextButton.isEnabled = false
                    backButton.isEnabled = false
                    
                    // ボタンの名前を停止とする
                    switchButton.setTitle("停止", for: .normal)
                    
                    // 背景色・ボタン内テキストサイズを変更
                    self.view.backgroundColor = UIColor.lightGray
                    switchButton.titleLabel?.font =
                    UIFont.systemFont(ofSize: 25)
                    
                } else if self.timer != nil {
                    // タイマーを停止
                    self.timer.invalidate()
                    
                    // nil にして再び再生(nil の時にタイマー生成)
                    self.timer = nil
                    
                    // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                    nextButton.isEnabled = true
                    backButton.isEnabled = true
                    
                    // ボタンの名前を再生とする
                    switchButton.setTitle("再生", for: .normal)
                    
                    // 背景色・ボタン内テキストサイズを戻す
                    self.view.backgroundColor = UIColor.white
                    switchButton.titleLabel?.font =
                    UIFont.systemFont(ofSize: 20)
                }
    }
   
   // 画像がタップされたとき処理が行えるように、Tap Gesture Recognizerを接続
    @IBAction func onTapAction(_ sender: Any) {
         self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    // 遷移元から遷移先にデータ(画像)を渡す
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のResultViewControllerのインスタンスを取得する
            let ZoomInViewController:ZoomInViewController = segue.destination as! ZoomInViewController
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[displayImageNo]
            // 画像を読み込み
            let image = UIImage(named: name)
            
            // 遷移先のZoomInViewControllerで宣言しているselectedImgに値を代入して渡す
            ZoomInViewController.selectedImg = image
        }
    
}

