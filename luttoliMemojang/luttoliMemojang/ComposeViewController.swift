//
//  ComposeViewController.swift
//  luttoliMemojang
//
//  Created by 김지훈 on 2021/10/23.
//

import UIKit

class ComposeViewController: UIViewController {
    
    
    @IBAction func close(_ sender: Any) {
        // 새 메모 화면은 모달 = 이런 화면을 닫을때 싸용
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
