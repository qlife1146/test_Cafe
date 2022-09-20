//
//  SnackViewController.swift

import UIKit
import Toast_Swift
import SDWebImage

class SnackViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: -- 메뉴
    let names: Array<String> = [
        "아메리카노", "카페 모카", "카페 라떼", "연유 라떼", "초콜릿 라떼", "캐러멜 마키아또", "에스프레소"
    ]
    
    //MARK: -- 가격
    let prices: Array<NSString> = [
        "HOT: ₩1,500\nICED: ₩2,000",
        "HOT: ₩2,000\nICED: ₩2,500",
        "HOT: ₩2,000\nICED: ₩2,500",
        "HOT: ₩2,000\nICED: ₩2,500",
        "HOT: ₩3,000\nICED: ₩3,500",
        "HOT: ₩3,000\nICED: ₩3,500",
        "HOT: ₩1,000"
    ]
    
    //MARK: -- 상품 이미지
    let images: Array<String> = [
        "http://paikdabang.com/wp-content/uploads/2018/05/%EC%95%97%EB%A9%94%EB%A6%AC%EC%B9%B4%EB%85%B8-1.jpg",
        "http://paikdabang.com/wp-content/uploads/2018/05/%EC%B9%B4%ED%8E%98%EB%AA%A8%EC%B9%B4-1.jpg",
        "http://paikdabang.com/wp-content/uploads/2018/05/%EB%B0%94%EB%8B%90%EB%9D%BC%EB%9D%BC%EB%96%BC-1.jpg",
        "http://paikdabang.com/wp-content/uploads/2018/05/%EC%B9%B4%EB%9D%BC%EB%A9%9C%EB%A7%88%EB%81%BC%EC%95%84%EB%98%90-1.jpg",
        "http://paikdabang.com/wp-content/uploads/2018/05/%EC%97%B0%EC%9C%A0%EB%9D%BC%EB%96%BC-1.jpg",
        "http://paikdabang.com/wp-content/uploads/2018/05/%EC%BD%94%EC%BD%94%EB%84%9B%EB%9D%BC%EB%96%BC-1.jpg",
        "http://paikdabang.com/wp-content/uploads/2018/05/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-1.jpg"
    ]
    
    let messages: Array<String> = [
        "대한민국의 국민 커피.",
        "에스프레소와 우유와 초콜릿의 조화로운 맛.",
        "우유를 넣어 부드럽고 든든한 맛.",
        "카페 라떼에 연유 추가.",
        "카페 라떼에 초콜릿 시럽 추가.",
        "에스프레소에 우유 거품을 얹고 캐러멜로 마무리.",
        "커피의 기본 소양."
    ]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.labelName.text = names[indexPath.row]
        cell.labelPrice.text = prices[indexPath.row] as String
        cell.imageViewItem.sd_setImage(with: URL(string: images[indexPath.row]))
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.hideAllToasts()
        self.view.makeToast(messages[indexPath.row], duration: 2.0, position: .bottom)
        
        let cell = tableView.cellForRow(at: indexPath) as! MyTableViewCell
        cell.contentView.backgroundColor = UIColor.red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            cell.contentView.backgroundColor = UIColor.white
        })
    }
}
