//
//  StatsViewController.swift
//  VideoStream
//
//  Created by Arthur BLANC on 26/01/2021.
//  Copyright © 2021 Arthur BLANC. All rights reserved.
//

import UIKit
import Charts

class StatsViewController: UIViewController {
    
    @IBOutlet var pieChart: PieChartView!
    
    var maskService: Service {
              return Service()
          }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("stats")
        self.pieChart.noDataTextColor = UIColor.white
        self.pieChart.holeColor = UIColor.init(red: 31/255, green: 31/255, blue: 31/255, alpha: 0.5)
        self.pieChart.legend.textColor = UIColor.white
        maskService.stat(completion:{ (mask) in
            self.pieChartUpdate(mask: mask)
        })
        // Do any additional setup after loading the view.
    }

    func pieChartUpdate (mask:Mask) {

        
        let entry1 = PieChartDataEntry(value: Double(mask.mask), label: "Masked  ")
        let entry2 = PieChartDataEntry(value: Double(mask.noMask), label: "Unmasked  ")
        let dataSet = PieChartDataSet(entries: [entry2, entry1], label: "    Users")
        dataSet.colors = [UIColor.init(displayP3Red: 180/255, green: 0, blue: 0, alpha: 1),
                          UIColor.init(displayP3Red: 0, green: 180/255, blue: 0, alpha: 1),
                          UIColor.init(displayP3Red: 0, green: 0, blue: 180/255, alpha: 1)]
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "Masked and unmasked users"
        pieChart.chartDescription?.textColor = UIColor.white
        pieChart.chartDescription?.font = UIFont(name: "Futura", size: 14)!

        //All other additions to this function will go here

        //This must stay at end of function
        pieChart.notifyDataSetChanged()
        //self.clearData()
    }
}
