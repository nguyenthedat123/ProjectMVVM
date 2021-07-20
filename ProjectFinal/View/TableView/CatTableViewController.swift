//
//  CatTableViewController.swift
//  ProjectFinal
//
//  Created by The Dat on 7/15/21.
//

import UIKit
import QNetwork

class CatTableViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var table: UITableView!
    
    //MARK: - Bien
    var viewModel: CatViewModel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTableView()
        self.bindViewModel()
    }
    
    //MARK: - func
    private func initTableView() {
        table.register(UINib(nibName: "CatTableViewCell", bundle: nil), forCellReuseIdentifier: "CatTableViewCell")
        table.delegate = self
        table.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel = CatViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.table.reloadData()
        }

        viewModel.needShowError = { [weak self] error in
            self?.showError(error: error)
        }

        // Request API here
        loadData()
        
    }
    
    
    func loadData() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        viewModel.requestRepositories()
        dispatchGroup.leave()

        dispatchGroup.enter()
        viewModel.requestRepositories()
        dispatchGroup.leave()
        
        dispatchGroup.enter()
        viewModel.requestRepositories()
        dispatchGroup.leave()
        
        dispatchGroup.enter()
        viewModel.requestRepositories()
        dispatchGroup.leave()

        // 1
        dispatchGroup.notify(queue: .main, execute: { [weak self] in
             self?.table.reloadData()
        })
    }

    
    private func showError(error: BaseError) {
        let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDataSource
extension CatTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CatTableViewCell") as! CatTableViewCell
        cell.bindData(data: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailCatViewController()
        vc.bindData(data: viewModel.didSelectRowAt(indexPath: indexPath))
        self.navigationController!.pushViewController(vc, animated: true)
       

    }
    
}

//MARK: - UITableViewDelegate
extension CatTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
