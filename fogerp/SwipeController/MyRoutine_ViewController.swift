//
//  MyRoutine_ViewController.swift
//  fogerp
//
//  Created by apple on 29/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class MyRoutine_ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "SingleRow_MyRoutine")as! SingleRow_MyRoutine
        
        return cell
    }
    
    
    @IBAction func Backbtn_click(_ sender: Any) {
        
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
