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

class ContainerViewController: UIViewController {
 
    enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case rightPanelExpanded
  }
  
  var centerNavigationController: UINavigationController!
  var centerViewController: CenterViewController!
  
  var currentState: SlideOutState = .bothCollapsed {
    didSet {
      let shouldShowShadow = currentState != .bothCollapsed
      showShadowForCenterViewController(shouldShowShadow)
    }
  }
    
  var leftViewController: Left_SidePanelViewController?
  var rightViewController: Right_SidePanelViewController?
  
  let Offset_For_Rightside: CGFloat = 200
  let Offset_For_Leftside: CGFloat = 90

    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    centerViewController = UIStoryboard.centerViewController()
    centerViewController.delegate = self
    
    centerNavigationController = UINavigationController(rootViewController: centerViewController)
    view.addSubview(centerNavigationController.view)
    addChild(centerNavigationController)
    centerNavigationController.didMove(toParent: self)
    

  }
}

private extension UIStoryboard {
    
  static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
  
  static func leftViewController() -> Left_SidePanelViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "LeftViewController") as? Left_SidePanelViewController
  }
  
  static func rightViewController() -> Right_SidePanelViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "RightViewController") as? Right_SidePanelViewController
  }
  
  static func centerViewController() -> CenterViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "CenterViewController") as? CenterViewController
  }
}


extension ContainerViewController: CenterViewControllerDelegate {
  
    ///////////////// from center view controller ////////
    func collapseSidePanels()
        {
            switch currentState
            {
                case .rightPanelExpanded:
                    toggleRightPanel()
                case .leftPanelExpanded:
                    toggleLeftPanel()
                default:
                    break
            }
       }
    
    
    
     ///////////////// from center view controller ////////
    func toggleLeftPanel()
        {
            let notAlreadyExpanded = (currentState != .leftPanelExpanded)
            if notAlreadyExpanded { addLeftPanelViewController() }
            animateLeftPanel(shouldExpand: notAlreadyExpanded)
        }
    
    
    
    
    ///////////////// from center view controller ////////
   func toggleRightPanel()
       {
            let notAlreadyExpanded = (currentState != .rightPanelExpanded)
            if notAlreadyExpanded { addRightPanelViewController() }
            animateRightPanel(shouldExpand: notAlreadyExpanded)
      }
    
  
    
   
    //////////// declared in this controller only /////////
   func addLeftPanelViewController()
     {
        guard leftViewController == nil else { return }
        if let vc = UIStoryboard.leftViewController()
            {
              addChildSidePanelController(vc)
              leftViewController = vc
            }
    }
  
    
    
    //////////// declared in this controller only /////////
  func animateLeftPanel(shouldExpand: Bool)
       {
            if shouldExpand
              {
                  currentState = .leftPanelExpanded
                  animateCenterPanelXPosition(targetPosition: centerNavigationController.view.frame.width - Offset_For_Leftside)
              }
            else
             {
                  animateCenterPanelXPosition(targetPosition: 0)
                      { _ in
                      
                        self.currentState = .bothCollapsed
                        self.leftViewController?.view.removeFromSuperview()
                        self.leftViewController = nil
                      }
             }
      }
  
  
  
            //////////// declared in this controller only /////////
          func addRightPanelViewController() {
            guard rightViewController == nil else { return }
            
            if let vc = UIStoryboard.rightViewController() {
              //vc.view.frame.size.width = vc.view.frame.width/2
              right_addChildSidePanelController(vc)
              rightViewController = vc
            }
          }

    
        //////////// declared in this controller only /////////
      func animateRightPanel(shouldExpand: Bool) {
        if shouldExpand
          {
            currentState = .rightPanelExpanded
            animateCenterPanelXPosition(
            targetPosition: -centerNavigationController.view.frame.width + Offset_For_Rightside)
          }
        else
            {
             animateCenterPanelXPosition(targetPosition: 0)
             { _ in
                 self.currentState = .bothCollapsed
                 self.rightViewController?.view.removeFromSuperview()
                 self.rightViewController = nil
            }
          }
      }
  
    
    
       //////////// declared in this controller only /////////
      func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut, animations: {
                    self.centerNavigationController.view.frame.origin.x = targetPosition
        }, completion: completion)
      }
  
    
    
    
    
    //////////// declared in this controller only /////////
     func addChildSidePanelController(_ sidePanelController: Left_SidePanelViewController) {
            sidePanelController.delegate = centerViewController
            view.insertSubview(sidePanelController.view, at: 0)
            addChild(sidePanelController)
            sidePanelController.didMove(toParent: self)
          }
  
 
    //////////// declared in this controller only /////////
    func right_addChildSidePanelController(_ sidePanelController: Right_SidePanelViewController) {
        sidePanelController.delegate = centerViewController
        view.insertSubview(sidePanelController.view, at: 0)
        addChild(sidePanelController)
        sidePanelController.didMove(toParent: self)
    }
    
    
    
    
  func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
    if shouldShowShadow {
      centerNavigationController.view.layer.shadowOpacity = 0.8
    } else {
      centerNavigationController.view.layer.shadowOpacity = 0.0
    }
  }
    
    
    
    
    
    
}

// MARK: Gesture recognizer

