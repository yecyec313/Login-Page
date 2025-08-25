//
//  ViewController.swift
//  Login_Screen
//
//  Created by alios on 5/15/1404 AP.
//

import UIKit

class ViewController: UIViewController {
    var titleLabel: UILabel!
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: CustomButton!
    var bottomConst:NSLayoutConstraint!
    var password = ""
    var username = ""
    var nameUser = "admin"
    var userPassword = "12345678"
    override func viewDidLoad() {
        super.viewDidLoad()
       setupView()
        setupTitle()
        setupTextFieldUsername()
        setupTextFieldPassword()
        setupCustomButton()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    func setupView(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(gesture)
        view.backgroundColor = .systemBackground
    }
    func setupCustomButton(){
        loginButton = CustomButton(frame: .zero, title: "Login")
        loginButton.addTarget(self, action: #selector(loginButtonTouch), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -32).isActive = true
        bottomConst = loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -32)
        bottomConst.isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
    }
    func setupTitle(){
        titleLabel = UILabel(frame: .zero)
        titleLabel.text = "ورود به دوره iOS"
        titleLabel.font = UIFont.buttonFont()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
      
    }
    func setupTextFieldUsername(){
        usernameTextField = UITextField(frame: .zero)
        usernameTextField.textAlignment = .right
        usernameTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.font = UIFont.textFieldFont()
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "نام کاربری"
        view.addSubview(usernameTextField)
        usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 32).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
    }
    func setupTextFieldPassword(){
        passwordTextField = UITextField(frame: .zero)
        passwordTextField.textAlignment = .right
        passwordTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.font = UIFont.textFieldFont()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "رمز ورود"
        view.addSubview(passwordTextField)
        passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor,constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
    }
    @objc func loginButtonTouch(){
        if password == userPassword && username.lowercased() == nameUser.lowercased(){
            print("you loggge")
        }else{
            let alert = UIAlertController(title: "خطا ", message: "رمز ورود یا نام کاربری نادرست است", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert,animated: true)
        }
    }
    @objc func viewTapped(){
        view.endEditing(true)
    }
    @objc func textDidChanged(textField: UITextField){
        if textField == passwordTextField{
            password = textField.text ?? ""
        }else{
            username = textField.text ?? ""
        }
        var passwordIsValid = false
        if password.count > 7{
            passwordIsValid = true
        }
        var usernameIsValid = false
        if !username.isEmpty{
            usernameIsValid = true
        }
        loginButton.isActive = passwordIsValid && usernameIsValid
    }
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let rect = keyFrame.cgRectValue
            let height = rect.height
            
            if  bottomConst.constant == -32{
                UIView.animate(withDuration: 0.5){
                    self.bottomConst.constant = -(height + 16)
                    self.view.layoutIfNeeded()
                }
                
            }
        }
    }
    @objc func keyHide(notification: NSNotification){
        UIView.animate(withDuration: 0.5){
            self.bottomConst.constant = -32
            self.view.layoutIfNeeded()
        }
           
          
        
        
    }
}

