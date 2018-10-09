//
//  ViewController.swift
//  FooTest
//
//  Created by Nick Matelli on 10/6/18.
//  Copyright © 2018 Foo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var footerView: UIView!

    var countries: [String] = []
    var cities: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        view.backgroundColor = UIColor.white
        
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        view.addSubview(tableView)
        
        footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.alpha = 1.0
        footerView.backgroundColor = UIColor.cyan
        view.addSubview(footerView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        footerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        footerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        footerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor, constant: -20).isActive = true
        
        countries = ["United States", "France", "China"]
        cities["United States"] = ["Los Angeles", "San Francisco", "Chicago"]
        cities["France"] = ["Paris", "Calais", "Nice"]
        cities["China"] = ["Beijing"]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: tableView.indexPathForSelectedRow ?? indexPath, animated: true)
        let vc = AnotherViewController()
        vc.title = cities[countries[indexPath.section]]?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = cities[countries[indexPath.section]]?[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countries[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let country = countries[section]
        return cities[country]?.count ?? 0
    }
}
