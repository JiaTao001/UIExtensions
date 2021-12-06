//
//  LoginVC.swift
//  CommonProject
//
//  Created by retail on 2021/10/29.
//

import UIKit
import SnapKit

class LoginVC: BaseViewController {
    
    var btn: CountdownButton!
//    var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationView.setLeftButtonImage(NavBlackImage, target: self, action: #selector(defaultBackAction))

//        tableview?.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
//            self.tableview?.mj_header?.endRefreshing()
//
//        })
        
        // Do any additional setup after loading the view.
        
//        btn = CountdownButton(frame: .zero, callback: { btn, state, count in
//            switch state {
//            case .normal:
//                btn.setTitle("获取验证码", for: .normal)
//                btn.setTitleColor(.black, for: .normal)
//                btn.backgroundColor = .yellow
//            case .countdown:
//                btn.setTitle("\(count)秒", for: .normal)
//                btn.setTitleColor(.red, for: .normal)
//                btn.backgroundColor = .blue
//            case .reget:
//                btn.setTitle("重新获取", for: .normal)
//                btn.setTitleColor(.black, for: .normal)
//                btn.backgroundColor = .yellow
//            }
//        })
//        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
//        view.addSubview(btn)
//
//        btn.snp.makeConstraints { (make) in
//            make.left.equalTo(50)
//            make.top.equalTo(100)
//            make.height.equalTo(80)
//            make.width.equalTo(200)
//        }
        navigationView.setTitle("登录", color: UIColor.black)

    }

    @objc private func btnClick(_ sender: UIButton) {
//        btn.start()
    }
    
    @IBAction func login(_ sender: Any) {
        
        UserManager.shared().user = User(JSON:["uid":"1101001"])
        var window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        if window == nil {
            window = UIApplication.shared.windows.first
        }
        AppDelegate().registNotification()
        window?.rootViewController = AppDelegate.getTabbarController(selectedIndex: 0)
    }
    
    
    @IBAction func forgetPassword(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordVC")

        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
}
