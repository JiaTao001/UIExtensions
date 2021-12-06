//
//  ChoseSchoolVC.swift
//  CommonProject
//
//  Created by Faria01 on 2021/11/12.
//

import UIKit
class SchoolCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var subTitleLB: UILabel!
}
class ChoseSchoolVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
   
    
  

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.setLeftButtonImage(NavBlackImage, target: self, action: #selector(defaultBackAction))
        navigationView.setTitle("选择学校", color: UIColor.black)

        // Do any additional setup after loading the view.
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")

        self.navigationController?.pushViewController(loginVC, animated: true)
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
