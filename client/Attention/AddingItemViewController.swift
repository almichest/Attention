//
//  AddingItemViewController.swift
//  Attension
//
//  Created by Hiraku Ohno on 2016/04/14.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import UIKit
import Bond

class AddingItemViewController: UIViewController {

    @IBOutlet weak private(set) var doneButton: UIButton!
    
    @IBOutlet weak private(set) var whereTextField: UITextField!
    @IBOutlet weak private(set) var whatTextView: UITextView!
    
    private lazy var placeHolderLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("example.attentionbody", comment: "")
        label.sizeToFit()
        label.font = UIFont.systemFontOfSize(14)
        label.alpha = 0.2
        label.numberOfLines = 0
        return label
    }()
    
    static func viewController() -> AddingItemViewController {
        guard let vc = R.storyboard.addingItemViewController.initialViewController() else {
            fatalError()
        }
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whatTextView.layer.borderColor = UIColor(red: 225.0 / 255.0, green: 225.0 / 255.0, blue: 225.0 / 255.0, alpha: 1.0).CGColor
        whatTextView.layer.borderWidth = 1.0
        whatTextView.layer.cornerRadius = 5.0
        whatTextView.bnd_text.observe { (event) in
            self.hidePlaceHolderIfNeeded()
        }

        whatTextView.addSubview(placeHolderLabel)

        whereTextField.placeholder = NSLocalizedString("example.placename", comment: "")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        placeHolderLabel.bounds = CGRect(x: 0, y: 0, width: CGRectGetWidth(whatTextView.bounds), height: 0)
        placeHolderLabel.sizeToFit()
        placeHolderLabel.frame.origin.x = 8
        placeHolderLabel.frame.origin.y = 4
    }

    private func hidePlaceHolderIfNeeded() {
        placeHolderLabel.hidden = (0 < whatTextView.text.characters.count)
    }
}

