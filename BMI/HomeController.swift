//
//  HomeController.swift
//  BMI
//
//  Created by MacUser on 2019-12-11.
//  Copyright © 2019 MacUser. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var userId: String?

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var txtGender: UITextField!
    
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
