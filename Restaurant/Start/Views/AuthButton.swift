//
//  AuthButton.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, view: UIView) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1)
        layer.cornerRadius = view.frame.width / 10
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, view: UIView, bgColor: UIColor) {
        self.init(title: title, view: view)
        backgroundColor = bgColor
        setTitleColor(.black, for: .normal)
    }
    
    convenience init(title: String, view: UIView, strColor: UIColor) {
        self.init(title: title, view: view)
        backgroundColor = .clear
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        setTitleColor(strColor, for: .normal)
    }
    
}
