//
//  Observable.swift
//  MVVMBindingSample
//
//  Created by Dario on 7/5/19.
//  Copyright © 2019 Dario Gasquez. All rights reserved.
//

class Observable<ObservedType> {

    var valueChanged: ( (ObservedType?) -> Void )?

    public var value: ObservedType? {
        get { return _value }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is now \(newValue)")
    }
    
    
    init(_ value: ObservedType) {
        self._value = value
    }

    
    private var _value: ObservedType?
    
}

