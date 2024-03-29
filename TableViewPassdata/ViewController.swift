//
//  ViewController.swift
//  TableViewPassdata
//
//  Created by Franco Rodrigues on 8/24/21.
//

import UIKit

struct Category {
    let title: String
    let items: [String]
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let data: [Category] = [
    Category(title: "Fruits", items: ["Apple","Banana","Pinaple"]),
    Category(title: "Car Models", items: ["BMW","Audi","Ferrati"]),
    Category(title: "Apple Devices", items: ["Mac","Ipad","Ipod"]),
    Category(title: "Cities", items: ["LA","SF","NY"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds

    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = data[indexPath.row]
        
        let vc = ListViewController(items: category.items)
        vc.title = category.title
        navigationController?.pushViewController(vc, animated: true)

    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
}



