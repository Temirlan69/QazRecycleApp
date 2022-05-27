//
//  MembersViewController.swift
//  QazRecycle
//
//  Created by Tima on 24.04.2022.
//

import UIKit

class MembersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
    }

    func setupBackButton() {
        let customBackButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = customBackButton

    }

    
}


