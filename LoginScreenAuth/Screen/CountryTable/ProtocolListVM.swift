//
//  PopUpListVM.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 01/12/2021.
//

import Foundation
protocol ProtocolListDelegate: AnyObject {
    func doneButtonAction(name: String)
}

class ProtocolListVM {
    
    var data = [Protocols]()
    var allData = [Protocols]()
    var dnsData = [Dns]()
    var name: String?
    
    func checkDuplicate() {
        var uniqueDict : [String:Protocols] = [:]
        allData = data
        data = allData.filter { proto in
            if uniqueDict[proto.proto] == nil {
                uniqueDict[proto.proto] = proto
                return true
            } else {
                return false
            }
        }
    }
    
    func selectedProtoData() {
        dnsData = []
        for proto in allData where proto.proto == name {
            dnsData.append(contentsOf: proto.dns ?? [])
        }
        print(dnsData)
    }
}
