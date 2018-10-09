//
//  AnotherViewController.swift
//  FooTest
//
//  Created by Nick Matelli on 10/6/18.
//  Copyright © 2018 Foo. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib: UINib? = UINib(nibName: "MyCell", bundle: nil)
        
        tableView = UITableView(frame: view.bounds)
        tableView.register(nib, forCellReuseIdentifier: "MyCell2")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        
        let guide = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
    }
}

extension AnotherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell2")!
        cell.backgroundColor = UIColor.purple
        return cell
    }
    
}

extension AnotherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell2")!
        return cell.frame.height
    }
}
