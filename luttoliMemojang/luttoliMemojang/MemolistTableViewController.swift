//
//  MemoListTableViewController.swift
//  luttoliMemojang
//
//  Created by 김지훈 on 2021/10/23.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    // 새로운 속성 = 날짜를 원하는 포멧으로 설정할때는 DateFormatter 사용
    let formatter: DateFormatter = { //클로저를 활용하여 초기화
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr") //지역도 설정할 수 있음
        return f
    }()
    
    //viewcontroller 관리하는 view가 화면에 표시되기 직전에 자동으로 호출, 여기에서 테이블뷰에게 목록을 업데이트하라고 알려주면됨
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        tableView.reloadData() //reloadData만 호출하면 데이터소스가 전달해주는 최신 데이터로 업데이트함
//        print(#function) //viewWillAppear가 실제로 호출되었는지 확인
    }
    
    //노티피케이션 선언할때 가장 중요한건 옵저버를 해지하는것 - 메모리 낭비 방지
    //토근 저장 속성 추가
    var token: NSObjectProtocol?
    
    //소멸자에서 해지
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    //viewDidLoad = viewcontroller를 생성하면 자동으로 생성, 주로 한번만 실행하는 초기화코드를 여기에 생성, 우리가 처리해야하는 이벤트는 view가 화면에 표시되는 이벤트
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //옵저버를 추가하는 코드는 한번만 실행하면되서 여기에 선언
        //옵저버를 추가할 이름, 특별한 이유가 없다면 nil, 노티피케이션 전달되면 테이블뷰를 업데이트해야함 UI를 업데이트해야함 = UI를 업데이트하는 코드는 메인에서 해야함 기본, 클로저 4번째로 전달한게 3번째에서 실행함
        //에드옵저버 = 옵저버를 사용할때 사용하는 객체를 리턴, 객체는 토큰
        //에드옵저버 메소드가 리턴하는 토큰을 이 속성에 저장
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in self?.tableView.reloadData()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let target = Memo.dummyMemoList[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate) //포메터에서 스트링 프럼 메소드로 날짜를 전달하면 지정한 스타일로 변환해서 문자열로 리턴해줌

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
