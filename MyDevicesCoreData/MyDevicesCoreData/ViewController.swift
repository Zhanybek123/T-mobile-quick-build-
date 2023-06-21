//
//  ViewController.swift
//  MyDevicesCoreData
//
//  Created by zhanybek salgarin on 4/26/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let mainTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var fetchedData: [Devices]?
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreData"
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.frame = view.bounds
        mainTableView.backgroundColor = .white
        configureNavBarButton()
    }
    
    func configureNavBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self,
                                                            action: #selector(didTapAddButton))
    }
    
    @objc func didTapAddButton() {
        let alertItem = UIAlertController(title: "New Goal",
                                          message: "Please Add a New Item",
                                          preferredStyle: .alert)
        let action = UIAlertAction(title: "Submit",
                                   style: .cancel) { [weak self] _ in
            guard let field = alertItem.textFields?.first,
                  let text = field.text,
                  !text.isEmpty else { return }
            self?.creatItems(name: text, deviceType: text)
        }
        alertItem.addTextField()
        alertItem.addAction(action)
        present(alertItem,animated: true)
    }
    
    func getAllItems() {
        do {
            fetchedData = try context?.fetch(Devices.fetchRequest())
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        } catch {
            fatalError("Didn't fetch the Data")
        }
    }
    
    func creatItems(name: String, deviceType: String) {
        
        let item = Devices(context: context ?? NSManagedObjectContext())
        item.name = name
        item.deviceType = name
        
        do {
            try context?.save()
            getAllItems()
        }
        catch {
            fatalError("Data wasn't created")
        }
    }
    
    func delete(item: Devices) {
        self.context?.delete(item)
        do {
            try context?.save()
            getAllItems()
        } catch {
            fatalError("Data wasn't saved")
        }
    }

    func update(item: Devices, with newName: String) {
        item.name = newName
        do {
            try context?.save()
            getAllItems()
        } catch {
            fatalError("Data wasn't saved")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedData?.count ?? 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
        let item = fetchedData?[indexPath.row].name
        var content = cell.defaultContentConfiguration()
        content.text = item
        cell.contentConfiguration = content
        cell.backgroundColor = .gray
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alertSheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        let updateAction = UIAlertAction(title: "Update", style: .default) { _ in
            
            let alert = UIAlertController(title: "EDIT", message: "Please update info", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Save Changes", style: .default, handler: { _ in
                guard let field = alert.textFields?.first,
                      let text = field.text,
                        !text.isEmpty else { return }
                guard let item = self.fetchedData?[indexPath.row] else { return }
                self.update(item: item, with: text)
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addTextField()
            alert.textFields?.first?.text = self.fetchedData?[indexPath.row].name
            alert.addAction(action)
            alert.addAction(cancel)
            self.present(alert, animated: true)
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            guard let item = self?.fetchedData?[indexPath.row] else { return }
            self?.delete(item: item)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertSheet.addAction(updateAction)
        alertSheet.addAction(deleteAction)
        alertSheet.addAction(cancelAction)
        present(alertSheet, animated: true, completion: nil)
    }
}
