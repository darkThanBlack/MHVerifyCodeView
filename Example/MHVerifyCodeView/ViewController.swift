//
//  ViewController.swift
//  MHVerifyCodeView
//
//  Created by feaskters on 04/30/2020.
//  Copyright (c) 2020 feaskters. All rights reserved.
//

import UIKit
import MHVerifyCodeView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViews(in: view)
    }
    
    // MARK: View
    
    private func loadViews(in box: UIView) {
        box.backgroundColor = .lightGray
        
        box.addSubview(mhField)
        [mhField].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        NSLayoutConstraint.activate([
            mhField.centerYAnchor.constraint(equalTo: box.centerYAnchor, constant: 0.0),
            
            mhField.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 0.0),
            mhField.rightAnchor.constraint(equalTo: box.rightAnchor, constant: 0.0),
            
            mhField.heightAnchor.constraint(equalToConstant: 64.0),
        ])
    }
    
    private func shouldSendCode(_ code: String) {
        let message = "shouldSendCode, code=\(code)"
        print("MOON__Log" + message)
        let alert = UIAlertController(title: "Hint", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        present(alert, animated: true)
    }
    
    private lazy var mhField: MHVerifyCodeView = {
        let field = MHVerifyCodeView { [weak self] code in
            self?.shouldSendCode(code)
        }
        return field
    }()
}

