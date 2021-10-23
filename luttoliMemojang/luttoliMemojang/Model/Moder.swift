//
//  Moder.swift
//  luttoliMemojang
//
//  Created by 김지훈 on 2021/10/23.
//

import Foundation

//메모클레스 < 내용과 날짜 저장
class Memo {
    var content: String //메모 내용
    var insertDate: Date //메모 생성한 날짜
    
    //클래스니까 속성을 초기화하는 속성자 생성
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    //더미데이터
    static var dummyMemoList = [
        Memo(content: "Lorem Ipsum"),
        Memo(content: "Subscribe + 👍 = ❤️")
    ]
}
