//
//  MainMenuViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/8.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
import Chameleon

class MainMenuViewController: UIViewController {
    let names = ["书单","排行","分类","设置"]
    var mainView:ViewController? = nil
    //TODO: 增加图片
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.flatPowderBlueColorDark()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainMenuViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainMenuTableViewCell") as? MainMenuTableViewCell
        cell?.label.text = names[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        //TODO： 添加主题切换
        cell?.backgroundColor = UIColor.flatPowderBlue()
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "unwindToMainFromMenu", sender: self)
        switch indexPath.row {
        case 0: mainView?.performSegue(withIdentifier: "showBookList", sender: self)
        case 1: mainView?.performSegue(withIdentifier: "showRank", sender: self)
        case 2: mainView?.performSegue(withIdentifier: "showClasses", sender: self)
        case 3: mainView?.performSegue(withIdentifier: "showSetting", sender: self)
        default:
            print("fail")
        }
    }
    
}
