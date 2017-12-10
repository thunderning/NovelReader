//
//  ViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/1.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
import SwiftTheme
import FlowingMenu

class ViewController: UIViewController {
    var menu: UIViewController?
    let flowingMenuTransitionManager = FlowingMenuTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add the pan screen edge gesture to the current view
        flowingMenuTransitionManager.setInteractivePresentationView(view)
        // Add the delegate to respond to interactive transition events
        flowingMenuTransitionManager.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.flatWhite()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMainViewController(_ sender: UIStoryboardSegue){

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentMenu" {
            let vc = segue.destination as! MainMenuViewController
            vc.transitioningDelegate = flowingMenuTransitionManager
            // 修改菜单大小
             vc.view.frame = CGRect(x: 0, y: 0, width: 250, height: vc.view.frame.height)
            flowingMenuTransitionManager.setInteractiveDismissView(vc.view)
            vc.mainView = self
            menu = vc
        }
    }
    
    

}
//调用第三方库，使用侧滑菜单
extension ViewController: FlowingMenuDelegate{
    func flowingMenuNeedsPresentMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        performSegue(withIdentifier: "PresentMenu", sender: self)
    }
    
    func flowingMenuNeedsDismissMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        menu?.performSegue(withIdentifier: "unwindToMainFromMenu", sender: self)
    }
}

