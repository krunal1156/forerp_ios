/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class CenterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleRow_tasklist_Dashboard")as!SingleRow_tasklist_Dashboard
        
        
        return cell
        
        
        
        
        
    }
    
    
    @IBOutlet weak var table_view: UITableView!
    @IBOutlet weak var TaskListContainer: UIView!
    @IBOutlet weak var Btn_Me: UIButton!
    @IBOutlet weak var Btn_Team: UIButton!
    
    @IBOutlet weak var Btn_all: UIButton!
    @IBOutlet weak var Btn_Major: UIButton!
    @IBOutlet weak var Btn_Minor: UIButton!
    
    @IBOutlet weak var Btn_All_s: UIButton!
    @IBOutlet weak var Btn_Low: UIButton!
    @IBOutlet weak var Btn_Normal: UIButton!
    @IBOutlet weak var Btn_High: UIButton!
    
    @IBOutlet weak var Btn_All_d: UIButton!
    @IBOutlet weak var Btn_This_month: UIButton!
    
    let backgroundImageView = UIImageView()
    
    var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions  
    @IBAction func leftbuttonclick(_ sender: Any) {  delegate?.toggleLeftPanel() }
    @IBAction func rightbuttonclick(_ sender: Any) { delegate?.toggleRightPanel() }
    
    @IBAction func btn_report_click(_ sender: Any) {
        delegate?.toggleRightPanel()
    }
    @IBAction func btn_type_click(_ sender: Any) {
        delegate?.toggleLeftPanel()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named :"newbgtwo.png")
        view.sendSubviewToBack(backgroundImageView)

        TaskListContainer.roundCorners(corners: [.topLeft,.topRight], radius: 60.0)
        
       
        Btn_Me.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_Team.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
        
        Btn_all.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_Minor.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
        
        
        Btn_All_s.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_High.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
      
        
        Btn_All_d.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_This_month.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
 
 
        
        
    }
   
   
    
}

extension CenterViewController:Left_SidePanelViewControllerDelegate,Right_SidePanelViewControllerDelegate {
    func clickeventfrom_right()  {
        
        delegate?.collapseSidePanels()
        
    }
    func clickeventfrom_left()   {
        
        
        delegate?.collapseSidePanels()
        
        
    }
    

}



protocol CenterViewControllerDelegate {
  func toggleLeftPanel()
  func toggleRightPanel()
  func collapseSidePanels()
}




extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
