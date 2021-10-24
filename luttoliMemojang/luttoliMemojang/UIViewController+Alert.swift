//
//  UIViewController+Alert.swift
//  luttoliMemojang
//
//  Created by 김지훈 on 2021/10/24.
//

import UIKit

// UIView 컨트롤러를 상속하는 모든 클래스에서 우리가 구현하는 메소드를 사용할 수 있도록 extension 선언

extension UIViewController {
    func alert(title: String = "알림", message: String) {
        //경고창을 표시할때 UIAlertController 사용
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        //생성한 버튼을 alert 버튼에 추가
        alert.addAction(okAction)
        
        //present로 경고창 화면에 표시
        present(alert, animated: true, completion: nil)
    }
}
