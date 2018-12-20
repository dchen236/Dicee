//
//  ViewController.swift
//  Dicee
//
//  Created by Danni on 12/18/18.
//  Copyright © 2018 Danni Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let dices = [#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6")]

    
    private let vegasImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "diceeLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backGroundView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "newbackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    private let leftDiceImage:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "dice1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightDiceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dice1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rollButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rollFunc), for: .touchUpInside)
        return button
    }()
    
    private func animation(){
        
        leftDiceImage.animationImages = dices
        rightDiceImage.animationImages = dices
        leftDiceImage.animationDuration = 0.4
        rightDiceImage.animationDuration = 0.4
        leftDiceImage.animationRepeatCount = 3
        rightDiceImage.animationRepeatCount = 3
        leftDiceImage.startAnimating()
        rightDiceImage.startAnimating()
    }
    @objc private func rollFunc(){
        animation()
        for _ in 0...5{
            let random1 = Int.random(in: 0...5)
            let random2 = Int.random(in: 0...5)
            leftDiceImage.image = dices[random1]
            rightDiceImage.image = dices[random2]
        }

    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollFunc()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        
    }

    private func setUpUI(){
        view.addSubview(backGroundView)
//        set up autolayout for greenish backgroundview
        NSLayoutConstraint.activate([backGroundView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
                                     backGroundView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
                                     backGroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                    backGroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        view.addSubview(vegasImageView)
//        set up autolayout for vegas image
        NSLayoutConstraint.activate([vegasImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     vegasImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                                     vegasImageView.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                                     vegasImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)])

//        set up autolayout for leftDice
        view.addSubview(leftDiceImage)
        leftDiceImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -100).isActive = true
        leftDiceImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        leftDiceImage.topAnchor.constraint(equalTo: vegasImageView.bottomAnchor, constant: 80).isActive = true
        leftDiceImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
//        set up autolayout for rightDice
        view.addSubview(rightDiceImage)
        rightDiceImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 100).isActive = true
        rightDiceImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        rightDiceImage.topAnchor.constraint(equalTo: vegasImageView.bottomAnchor, constant: 80).isActive = true
        rightDiceImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
//        set up autolayout for roll button
        view.addSubview(rollButton)
        rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-100).isActive = true
        rollButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        rollButton.widthAnchor.constraint(equalToConstant:200).isActive = true
        rollButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
    }


}

