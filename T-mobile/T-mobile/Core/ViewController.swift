//
//  ViewController.swift
//  T-mobile
//
//  Created by zhanybek salgarin on 6/21/23.
//

import UIKit

enum Styles: String, CaseIterable {
    case first, second, third
}

class ViewController: UIViewController {
    
    var someView = UIView()
    lazy var searchBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchBarButtonTapped))
        button.tintColor = .label
        return button
    }()
    
    var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Good Afternoon, Zhan"
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        //        label.font = UIFont.italicSystemFont(ofSize: 0.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .label
        return label
    }()
    
    private var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private var separatorView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in to mannage your account", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    var mainTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.cellID)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        confugureProperties()
        configureNavigaionBarButton()
    }
    
    func confugureProperties() {
        view.addSubview(greetingLabel)
        view.addSubview(separatorView)
        view.addSubview(separatorView2)
        view.addSubview(loginButton)
        view.addSubview(mainTableView)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            separatorView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 22),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 10),
            
            loginButton.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            
            separatorView2.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 22),
            separatorView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView2.heightAnchor.constraint(equalToConstant: 10),
            
            mainTableView.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 8),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    func configureNavigaionBarButton() {
        navigationItem.rightBarButtonItem = searchBarButton
    }
    
    @objc func searchBarButtonTapped() {
        print("Button tapped")
    }
}

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Styles.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        switch Styles.allCases[indexPath.row] {
        case .first:
            cell.configureImage(with: "first")
        case .second:
            cell.configureImage(with: Styles.second.rawValue)
        case .third:
            cell.configureImage(with: Styles.third.rawValue)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let additionalSeparatorThickness = CGFloat(10)
        let additionalSeparator = UIView(frame: CGRectMake(0,
                                                           cell.frame.size.height - additionalSeparatorThickness,
                                                           cell.frame.size.width,
                                                           additionalSeparatorThickness))
        additionalSeparator.backgroundColor = UIColor.gray
        cell.addSubview(additionalSeparator)
    }
}
