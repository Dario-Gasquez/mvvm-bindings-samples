//
//  BoundedTextField.swift
//  MVVMBindingSample
//
//  Created by Dario on 7/5/19.
//  Copyright © 2019 Dario Gasquez. All rights reserved.
//

import UIKit

class BoundedTextField: UITextField {
    
    var valueChangedClosure: ( () -> Void )?
    
    @objc func valueChanged() {
        valueChangedClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self, action: #selector(BoundedTextField.valueChanged), for: .editingChanged)
        
        valueChangedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "")
        }
        
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}

