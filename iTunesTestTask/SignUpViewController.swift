//
//  SignUpViewController.swift
//  iTunesTestTask
//
//  Created by Arina on 18.07.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "First Name"
        return textField
    }()
    
    private let firstNameValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Second Name"
        return textField
    }()
    
    private let secondNameValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Phone"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let phoneValidLabel: UILabel = {
        let label = UILabel ()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "E-mail"
        return textField
    }()
    
    private let emailValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    
    private let passwordValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("SignUp", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var elementsStackView = UIStackView()
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        setupViews()
        setConstraints()
        setupDelegate()
        setupDataPicker()
        
        registerKeyboardNotification()
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
    private func setupViews () {
        title = "SignUp"
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        
        elementsStackView = UIStackView(arrangedSubviews: [firstNameTextField, firstNameValidLabel, secondNameTextField, secondNameValidLabel, datePicker, ageValidLabel, phoneNumberTextField, phoneValidLabel, emailTextField, emailValidLabel, passwordTextField, passwordValidLabel])
        elementsStackView.axis = .vertical
        elementsStackView.spacing = 10
        elementsStackView.distribution = .fillProportionally
        elementsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(elementsStackView)
        backgroundView.addSubview(loginLabel)
        backgroundView.addSubview(signUpButton)
    }
    
    private func setupDelegate() {
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupDataPicker() {
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.layer.borderColor = UIColor(ciColor: .white).cgColor
        datePicker.layer.borderWidth = 1
        datePicker.clipsToBounds = true
        datePicker.layer.cornerRadius = 6
        datePicker.tintColor = .black
    }
    
    @objc private func signUpButtonTapped() {
        print ("SignUpTapped")
    }
}

//MARK: - UITextFieldDelegate

extension SignUpViewController: UITextFieldDelegate {
    
    func textfield(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
    
    // при нажатии на return клаиватура исчезает
    func textFieldShowldReturn( textfield: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        secondNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

// создаем обзервер, который будет наблюдать открыта ли у нас клавиватура и, если да, то поднимать контент, чтобы мы смогли видеть поле ввода
extension SignUpViewController {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, // мы должны понять, когда клавиатура будет подниматься. Когда клаиватура будет подниматься, будет вызываться метод keyboardWillShow
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, // мы должны понять, когда клавиатура будет подниматься. Когда клаиватура будет подниматься, будет вызываться метод keyboardWillShow
                                               object: nil)
    }
    // после того, как происходит деинит контроллера, мы должны удалить нотификейшн
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
}


//MARK: - SetConstraints

extension SignUpViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
        scrollView.bottomAnchor.constraint (equalTo: view.bottomAnchor, constant: 0),
        
        backgroundView.centerYAnchor.constraint (equalTo: scrollView.centerYAnchor),
        backgroundView.centerXAnchor.constraint (equalTo: scrollView.centerXAnchor),
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor),
        
        elementsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
        elementsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
        elementsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
        elementsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
        
        loginLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
        loginLabel.bottomAnchor.constraint(equalTo: elementsStackView.topAnchor, constant: -30),
        
        signUpButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
        signUpButton.topAnchor.constraint(equalTo: elementsStackView.bottomAnchor, constant: 30),
        signUpButton.heightAnchor.constraint(equalToConstant: 40),
        signUpButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
