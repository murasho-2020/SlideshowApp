//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by Shousei  Murakami on 2020/07/18.
//  Copyright © 2020 shousei.murakami2. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController {
    // １画面目で選択された画像の入れ物を作る
    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image Viewに画像を設定
        imageView.image = selectedImg
    }
    
    //  戻るボタンで１画面目に戻る
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
