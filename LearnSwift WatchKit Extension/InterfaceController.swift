//
//  InterfaceController.swift
//  LearnSwift WatchKit Extension
//
//  Created by Alasdair Morrison on 07/01/2017.
//  Copyright © 2017 Alasdair Morrison. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    
    let HelpRequests = ["Lucy","Peter","Paul"]

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
//        // Configure interface objects here.
//        table?.setNumberOfRows(HelpRequests.count, withRowType:"")
//        
//        for (index,personName) in HelpRequests.enumerated()  {
//            if let row = table.rowController(at: index) as? HelpRequestRowController {
//                row.nameLabel.setText(personName)
//            }
//        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
