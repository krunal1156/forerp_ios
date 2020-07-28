//
//  View_Expense_ViewController.swift
//  fogerp
//
//  Created by apple on 26/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class View_Expense_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Single_Row_ViewExpense")as! Single_Row_ViewExpense
        
        return cell
    }
    
    @IBAction func backBtn_click(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
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
