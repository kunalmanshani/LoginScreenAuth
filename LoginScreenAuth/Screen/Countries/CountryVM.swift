//
//  CountryVM.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 24/11/2021.
//

import Foundation

protocol CountryDelegate: AnyObject {
    func dataDidLoad()
}

class CountryVM {
    
    var data = [Countries]()
    var allData = [Countries]()
    var protocolArray = [Protocols]()
    
    var cancelSearchText = ""
    
    weak var delegate: CountryDelegate?
    
    func fetchData() {
        //file location
        do {
            guard let fileLocation = Bundle.main.url(forResource: "formatedData", withExtension: "json") else {
                fatalError("cant find this file")
            }
            let data = try Data(contentsOf: fileLocation)
            let decoder = try JSONDecoder().decode(fullData.self, from: data)
            self.data = decoder.body.countries
            self.allData = decoder.body.countries
            self.delegate?.dataDidLoad()
        } catch {
            print(error)
        }
    }
    func filterData(searchText: String){
        if searchText.isEmpty {
            self.delegate?.dataDidLoad()
        }
        else{
            data = allData.filter({ $0.name.lowercased().contains(searchText.lowercased())})
            self.delegate?.dataDidLoad()
            
        }
    }
    func cancelSearch(){
        data = allData
        self.delegate?.dataDidLoad()
    }
}
