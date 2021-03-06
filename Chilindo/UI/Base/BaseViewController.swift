//
//  BaseViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import Cartography

/**
 * Base view conctroller has all the base methods
 *
 */
open class BaseViewController: UIViewController {
    var dialogFullScreenView: UIView?
    var dialogLoadingGroup: STLoadingGroup?

    override open func viewDidLoad() {
        super.viewDidLoad()
        showNavigationBar()
        customNavigationBarColor()
        hideNavigationBottomLine()
    }
    
    /**
     *
     * When needs to add the menu icon
     */
    func addMenuIconOnNavigationBar() -> Void {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Menu" as String), for: .normal)
        button.addTarget(self, action: #selector(openLeftMenu), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 17.0, height: 15)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func openLeftMenu(){
        // can override this in sub class
    }
    
    /**
     * Navigation customize
     *
     */
    public func customNavigationBarColor(){
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
    }
    
    public func hideNavigationBottomLine() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    public func hideNavigationBar(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public func showNavigationBar(){
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    /**
     * Progress dialog show/hide
     *
     */
    public func showProgressDialog(){
        dialogLoadingGroup = STLoadingGroup(side: 80, style: .arch)
        
        if dialogFullScreenView == nil {
            dialogFullScreenView = UIView(frame: self.view.frame)
            dialogFullScreenView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 0.3)
        }
        
        if !(dialogFullScreenView?.isDescendant(of: self.view))!{
            self.view.addSubview(dialogFullScreenView!)
            constrain(dialogFullScreenView!) { view in
                view.edges == view.superview!.edges
            }
        }
        
        dialogLoadingGroup?.show(dialogFullScreenView)
        dialogLoadingGroup?.startLoading()
    }
    
    public func hideProgressDialog(){
        dialogLoadingGroup?.stopLoading()
        dialogFullScreenView?.removeFromSuperview()
    }
}
