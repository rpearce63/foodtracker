//
//  MealDetailViewController.swift
//  FoodTracker
//
//  Created by Rick Pearce on 9/19/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var mealTitleLabel: UILabel!
    
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let meal = meal {
            //navigationItem.title = meal.name
            //print(meal.name)
            mealTitleLabel.text   = meal.name
           // photoImageView.image = meal.photo
            //ratingControl.rating = meal.rating
        }

        //mealTitleLabel.text = meal?.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditMeal" {
            let nav = segue.destination as! UINavigationController
            let mealViewController = nav.topViewController as! MealViewController
            
            // Get the cell that generated this segue.
            if let selectedMeal = meal {
                mealViewController.meal = selectedMeal
            
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
                   //navigationController!.popViewController(animated: true)
                   dismiss(animated: true, completion: nil)
         }
    

   }
