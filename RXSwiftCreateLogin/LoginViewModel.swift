//
//  LoginViewModel.swift
//  RXSwiftCreateLogin
//
//  Created by Tran Duc Anh on 8/20/19.
//  Copyright © 2019 Tran Duc Anh. All rights reserved.
//

import RxSwift
import RxCocoa
class LoginViewModel {
    
    // Khai báo biến để hứng dữ liệu từ VC
    var usernameText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay<String>(value: "")
    
    // Khai báo viến Bool để lắng nghe sự kiện và trả về kết quả thoả mãn điều kiện
    var isValidUsername: Observable<Bool> {
        return self.usernameText.asObservable().map({ username in
            username.count >= 6
        })
    }
    
    var isValidPassword: Observable<Bool> {
        return self.passwordText.asObservable().map({ password in
            password.count >= 6
        })
    }
    
    // Khai báo biến để lắng nghe kết quả của cả 2 sự kiện trên
    var isValid: Observable<Bool> {
        return Observable.combineLatest(isValidUsername, isValidPassword) {$0 && $1}
    }
    
}
