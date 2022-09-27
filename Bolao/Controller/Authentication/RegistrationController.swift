//
//  RegistrationController.swift
//  Bolao
//
//  Created by Vagner Machado on 26/09/22.
//

import UIKit

class RegistrationController: UIViewController {
  
  //MARK: - Properties
  
  private let logoImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.tintColor = .white
    iv.image = UIImage(systemName: "trophy")
    return iv
  }()
  
  private lazy var emailContainerView: UIView = {
    guard let image = UIImage(systemName: "envelope") else { return UIView() }
    let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
    return view
  }()

  private lazy var passwordContainerView: UIView = {
    guard let image = UIImage(systemName: "lock") else { return UIView() }
    let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)
    return view
  }()
  
  private lazy var fullNameContainerView: UIView = {
    guard let image = UIImage(systemName: "envelope") else { return UIView() }
    let view = Utilities().inputContainerView(withImage: image, textField: fullNameTextField)
    return view
  }()

  private lazy var userNameContainerView: UIView = {
    guard let image = UIImage(systemName: "lock") else { return UIView() }
    let view = Utilities().inputContainerView(withImage: image, textField: userNameTextField)
    return view
  }()
  
  private let emailTextField: UITextField = {
    let tf = Utilities().textFiled(withPlaceholder: "Email")
    return tf
  }()

  private let passwordTextField: UITextField = {
    let tf = Utilities().textFiled(withPlaceholder: "Senha")
    tf.isSecureTextEntry = true
    return tf
  }()
  
  private let fullNameTextField: UITextField = {
    let tf = Utilities().textFiled(withPlaceholder: "Nome")
    return tf
  }()

  private let userNameTextField: UITextField = {
    let tf = Utilities().textFiled(withPlaceholder: "Usuário")
    tf.isSecureTextEntry = true
    return tf
  }()
  
  private lazy var registerButton: UIButton =  {
    let button = UIButton(type: .system)
    button.setTitle("Registrar", for: .normal)
    button.setTitleColor(.grassGreen, for: .normal)
    button.backgroundColor = .white
    button.heightAnchor.constraint(equalToConstant : 50).isActive = true
    button.layer.cornerRadius = 5
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    return button
  }()

  private lazy var accountCreatedButton: UIButton = {
    let button = Utilities().attributedButton("Já possui uma conta? ", "Logar")
    button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    return button
  }()

  //MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  //MARK: - Selectors
  
  @objc func handleRegister() {
     print("register")
  }

  @objc func handleShowLogin() {
    navigationController?.popViewController(animated: true)
  }
  
  //MARK: - Helpers
  func configureUI() {
    view.backgroundColor = .grassGreen

    view.addSubview(logoImageView)
    logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
    logoImageView.setDimensions(width: 120, height: 120)
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullNameContainerView, userNameContainerView, registerButton])
    stack.axis = .vertical
    stack.spacing = 20
    stack.distribution = .fillEqually
    
    view.addSubview(stack)
    stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)

    view.addSubview(accountCreatedButton)
    accountCreatedButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)

  }
  
  
}
