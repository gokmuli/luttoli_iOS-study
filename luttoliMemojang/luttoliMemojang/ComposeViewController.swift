//
//  ComposeViewController.swift
//  luttoliMemojang
//
//  Created by 김지훈 on 2021/10/23.
//

import UIKit

class ComposeViewController: UIViewController {
    
    //cancel 버튼 연결
    @IBAction func close(_ sender: Any) {
        // 새 메모 화면은 모달 = 이런 화면을 닫을때 싸용
        dismiss(animated: true, completion: nil)
    }
    
    //textview 입력창 선언
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        //메모 저장
        guard let memo = memoTextView.text, memo.count > 0 else {
            //경고창 호출
            alert(message: "메모를 입력하세요.")
            return
        }
        
        //메모를 정상적으로 입력한경우
        //새로운 메모 선언
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        //화면을 닫기전에 노티피케이션 전달, 라디오방송국에서 라디오방송을 브로드케스팅하는것과 같음, 노티피케이션은 특정 계체에게 바로 전달되지 않음, 이건 유닛케스트, 노티피케이션은 브로드케스트와 같다
        NotificationCenter.default.post(name: ComposeController.newMemoDidInsert, object: nil)
        
        
        //새 메모 화면 닫기
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

//시트 방식으로 화면을 표시할때는 화면 전환을 처리하는 방식이 달라짐, 뷰윌어피얼 매소드가 호출되지 않음 노티피케이션으로 해결
//쓰기화면에서 새로운 메모가 저장되면 노티피케이션을 하나 전달, 그리고 목록화면은 노티피케이션 전달되는 시점에 업데이트
extension ComposeViewController {
    //라디오방송, 라디오방송국에 해당하는 노티피케이션센터, 이름으로 구분
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
