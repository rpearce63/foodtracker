//
//  DatePickerController.swift
//  FoodTracker
//
//  Created by Rick Pearce on 9/19/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class DatePickerController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    var viewLoadedCompletion : ((_ datePicker: UIDatePicker)->Void)!
    var valueChangedCompletion : ((_ date: Date)->Void)!
    var selectedDate : Date?
    var senderName : String?
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .full
        
        if (self.viewLoadedCompletion != nil) {
            self.viewLoadedCompletion?(self.datePicker)
        }
        datePicker.date = selectedDate!
        dateLabel.text = dateFormatter.string(from: selectedDate!)
    }
    
    @IBAction func valueChanged(sender: UIDatePicker) {
        if (self.valueChangedCompletion != nil) {
            self.valueChangedCompletion?(sender.date as Date)
        }
        dateLabel.text = dateFormatter.string(from: sender.date)
    }
}
