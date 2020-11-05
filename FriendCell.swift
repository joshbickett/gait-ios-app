//
//  FriendCell.swift
//  Gait
//
//  Created by Joshua Bickett on 10/8/20.
//  Copyright © 2020 Joshua Bickett. All rights reserved.
//


import Foundation
import UIKit
import MessageUI

class FriendCell: UITableViewCell, MFMessageComposeViewControllerDelegate {
    
    var viewController: UIViewController?
    var test = 0
    
    // MARK:- Objects
    var uiManager: UIManager!
    
    // MARK:- CGFloat
    var colWidth: CGFloat!
    
//    TODO: go and rename all anchorHeights to something that makes more sense.
    var anchorHeight: CGFloat!
    
//    MARK:- Labels
    
    let friendNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont().mdFont
        
        label.numberOfLines = 3
        let paragraphStyle = NSMutableParagraphStyle()
        //line height size
        paragraphStyle.lineSpacing = 4
        let attrString = NSMutableAttributedString(string: "")
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        label.textAlignment = NSTextAlignment.center
        
        label.text = "For the time being, invite a friend to download the app 👉"
        
        label.textColor = .black
        return label
    }()
    
    
//    MARK: BUTTONS
    
    var inviteByTextButton: UIButton = {
//        https://stackoverflow.com/questions/26350220/sending-sms-in-ios-with-swift
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       
        button.setTitle("Click here", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor().brandDarkGray, for: .highlighted)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont().mdFont
        button.backgroundColor = UIColor().bootPrimary
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
//        self.backgroundColor = UIColor().brandLightGray
        self.backgroundColor = .white
        self.accessoryView = .none
        self.selectionStyle = .none
        self.contentView.layer.borderWidth = 0
        self.layer.borderWidth = 0
        
        self.contentView.addSubview(friendNameLabel)
        self.contentView.addSubview(inviteByTextButton)
        
        inviteByTextButton.addTarget(self, action: #selector(inviteByTextTapped), for: .touchUpInside)
        
        
        
        
       
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        friendNameLabel.frame = CGRect(x: colWidth/2, y: 0, width: colWidth*7, height: anchorHeight*2.5)
        inviteByTextButton.frame = CGRect(x: colWidth*8.5, y: anchorHeight*(3/4), width: colWidth*3, height: anchorHeight)
        
    }
    
    // MARK:- Methods for view controller navigation
    @objc func inviteByTextTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        sendText(sender: inviteByTextButton)
    }
    
    func showModalViewController() {
        let addFriendViewController = AddFriendViewController()
        addFriendViewController.modalPresentationStyle = .overCurrentContext
        addFriendViewController.modalTransitionStyle = .crossDissolve

        if let vc = viewController {
            vc.present(addFriendViewController, animated: true, completion: nil)
        }
        
    }
    
    func sendText(sender: UIButton) {
        if (MFMessageComposeViewController.canSendText()) {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
            let controller = MFMessageComposeViewController()
            controller.body = "Hi! Try out this cool app! It provides a score based on how you drive (0-100). See if you can beat my score! https://apps.apple.com/us/app/gait-a-driver-score-app/id1516971190"
//            controller.recipients = [phoneNumber.text]
            controller.messageComposeDelegate = self
            if let vc = viewController {
                vc.present(controller, animated: true, completion: nil)
            }
            
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        if let vc = viewController {
            vc.dismiss(animated: true, completion: nil)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


