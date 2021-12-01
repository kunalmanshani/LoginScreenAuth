//
//  CountryTableVC.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 24/11/2021.
//

import UIKit

class CountryVC: UIViewController {
    
    let viewModel = CountryVM()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
        viewModel.delegate = self
//        searchBar.delegate = self
        
    }
}
extension CountryVC: CountryDelegate {
    func dataDidLoad() {
        tableView.reloadData()
        print("dataDidLoad")
    }
}

extension CountryVC: CountryTVCellDelegate {
    
    func showButtonDidTap(item: Countries) {
        
        viewModel.protocolArray = item.protocols
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProtocolListVC") as! ProtocolListVC
        vc.delegate = self
        vc.viewModel.data = viewModel.protocolArray
        self.present(vc, animated: true, completion: nil)
    }
}

extension CountryVC: ProtocolListDelegate {
    func doneButtonAction(name: String) {
        showAlert(title: "item selected", message: "\(name)")
    }
}

extension CountryVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.data.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTVCell
        let item = viewModel.data[indexPath.row]
        cell.populate(item: item)
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? CountryTVCell {
            let item = viewModel.data[indexPath.row]
            cell.willDisplay(item: item)
     }
}
    
}
extension CountryVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterData(searchText: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.cancelSearch()
        searchBar.text = viewModel.cancelSearchText
    }
}
