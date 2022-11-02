//
//  ViewController.swift
//  SomeCoreData
//
//  Created by Evgen on 01/11/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataManager = MeterDataManager()

    @IBAction func addBtnPressed(_ sender: Any) {
        
        let typeId = Int.random(in: 1..<4)
        
        dataManager.createMeter(MeterType.init(rawValue: typeId)!, value: Decimal(Int.random(in: 1..<10000)))
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.get(count: 100)?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        if let meter = dataManager.getByIndexOrDefault(indexPath.row) {
            cell.textLabel?.text = meter.name
            cell.detailTextLabel?.text = "\(meter.value!) \(meter.type)"
        }
        
        return cell
    }
    


}

