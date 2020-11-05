//
//  FriendTitleCell.swift
//  Gait
//
//  Created by Joshua Bickett on 10/8/20.
//  Copyright © 2020 Joshua Bickett. All rights reserved.
//

import Foundation
import UIKit

class FriendsHeaderCell: UITableViewCell {
    
    
    var viewController: UIViewController?
    var test = 0
    
    // MARK:- Objects
    var uiManager: UIManager!
    
    // MARK:- CGFloat
    var colWidth: CGFloat!
    
//    TODO: go and rename all anchorHeights to something that makes more sense.
    var anchorHeight: CGFloat!
    
//    MARK:- Labels
    
    let friendsHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 20)
        label.text = "Friends ▼"
        label.textColor = .white
        return label
    }()
    
 
    
//    MARK: BUTTONS
  
    
    var addFriendsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       
//        button.setTitle("Add friends", for: .normal)
        button.setTitle("Coming soon...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor().bootGrayDark, for: .highlighted)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont().smFont
        button.backgroundColor = UIColor().bootGrayDark
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        uiManager = UIManager(view: self.contentView)
        
        colWidth = UIManager.getColWidth()
        anchorHeight = UIManager.getAnchorHeight()
   
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor().bootPrimary
        self.accessoryView = .none
        self.selectionStyle = .none
        self.contentView.layer.borderWidth = 0
        self.layer.borderWidth = 0
        
        self.contentView.addSubview(friendsHeaderLabel)
        self.contentView.addSubview(addFriendsButton)
        
//        addFriendsButton.addTarget(self, action: #selector(addFriendsTapped), for: .touchUpInside)
       
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        friendsHeaderLabel.frame = CGRect(x: colWidth*4, y: 0, width: colWidth*4, height: anchorHeight*1.5)
        addFriendsButton.frame = CGRect(x: colWidth*8.5, y: anchorHeight*0.35, width: colWidth*3, height: anchorHeight*0.75)
        
    }
    
    // MARK:- Methods for view controller navigation
    @objc func addFriendsTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        showModalViewController()
    }
    
    func showModalViewController() {
        let addFriendViewController = AddFriendViewController()
        addFriendViewController.modalPresentationStyle = .overCurrentContext
        addFriendViewController.modalTransitionStyle = .crossDissolve

        if let vc = viewController {
            vc.present(addFriendViewController, animated: true, completion: nil)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

