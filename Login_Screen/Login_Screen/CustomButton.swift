//
//  CustomButton.swift
//  Login_Screen
//
//  Created by alios on 5/16/1404 AP.
//

import UIKit

class CustomButton: UIButton{
    var contentView: UIView!
    var contentLabel: UILabel!
    var title = ""
    var isActive = false{
        didSet{
            updateView()
        }
    }
    init(frame: CGRect,title:String) {
        super.init(frame: frame)
         self.title = title
        isUserInteractionEnabled = isActive
        setupConttentView()
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    func updateView(){
        isUserInteractionEnabled = isActive
        contentView.alpha = isActive ? 1: 0.5
    }
    func setupConttentView(){
        
        contentView = UIView(frame:  .zero)
        contentView.backgroundColor = .orange
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 12
        contentView.isUserInteractionEnabled = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        contentLabel = UILabel(frame:  .zero)
        contentLabel.text = title
        contentLabel.font = UIFont.buttonFont(size: 15)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.isUserInteractionEnabled = false
        contentView.addSubview(contentLabel)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
}
