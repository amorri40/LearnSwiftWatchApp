//
//  HelpTableInterfaceController.swift
//  LearnSwift
//
//  Created by Alasdair Morrison on 08/01/2017.
//  Copyright © 2017 Alasdair Morrison. All rights reserved.
//

import Foundation

import WatchKit

class HelpTableInterfaceController: WKInterfaceController {
    
    
    
    @IBOutlet weak var table: WKInterfaceTable!
    
//    let helpRequests = ["Lucy","Peter","Paul","Ali"]
    
    let helpRequests = [["name":"Lucy", "skill":"Java"],
        ["name":"Peter", "skill":".Net"],
                        ]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        print("awake")
        
        // Configure interface objects here.
        table?.setNumberOfRows(helpRequests.count, withRowType:"HelpRowType")
        
        for (index,person) in helpRequests.enumerated()  {
            if let row = table.rowController(at: index) as? HelpRequestRowController {
                row.nameLabel.setText(person["name"])
                row.skillLabel.setText(person["skill"])
            }
        }
        
    }
    
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return helpRequests[rowIndex] as AnyObject?
    }
}
