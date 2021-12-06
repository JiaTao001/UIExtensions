//
//  CheckEmailVC.swift
//  CommonProject
//
//  Created by Faria01 on 2021/11/12.
//

import UIKit

class CheckEmailVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.setTitle("输入邮箱", color: UIColor.black)
        navigationView.setRightButtonImage(UIImage.init(named: "icon_global")!, target: self, action: #selector(choseArea))
        // Do any additional setup after loading the view.
        
        
        
    }
    @objc func choseArea()  {
       
        let alert:UIAlertController = UIAlertController(title: "选择地区", message: nil,
                                                        preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Demo", style: .default, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_global")!, for: .normal)

        }))
        alert.addAction(UIAlertAction(title: "Global", style: .default, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_global")!, for: .normal)

        }))
        alert.addAction(UIAlertAction(title: "中国", style: .default, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_china")!, for: .normal)

        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_global")!, for: .normal)
            
        }))
       
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func nextStep(_ sender: Any) {
        
        
        let alert:UIAlertController = UIAlertController(title: "选择地区", message: nil,
                                                        preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Demo", style: .default, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_global")!, for: .normal)
            self.goToNext()

            
        }))
        alert.addAction(UIAlertAction(title: "Global", style: .default, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_global")!, for: .normal)
            self.goToNext()


        }))
        alert.addAction(UIAlertAction(title: "中国", style: .default, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_china")!, for: .normal)
            self.goToNext()

 
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action:UIAlertAction) in
            self.navigationView.rightButton.setImage(UIImage.init(named: "icon_global")!, for: .normal)
            
        }))
       
        self.present(alert, animated: true, completion: nil)
        
     
        
    }
    func goToNext() {
        let choseSchoolVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ChoseSchoolVC")

        self.navigationController?.pushViewController(choseSchoolVC, animated: true)
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
