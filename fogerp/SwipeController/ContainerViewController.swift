import UIKit


class ContainerViewController: UIViewController {
 
    enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case rightPanelExpanded
  }
  
  var centerNavigationController: UINavigationController!
  var centerViewController: CenterViewController!
  var acknowledgement_controller : Acknowledgement_ViewController!
    
  
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
    
    centerNavigationController = UINavigationController(rootViewController:centerViewController)
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
  
    static func acknowledgement_Viewcontroller() -> Acknowledgement_ViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "Acknowledgement_ViewController") as? Acknowledgement_ViewController
    }
}


extension ContainerViewController: CenterViewControllerDelegate {
  
    ////////////// test ///////////////////////
    func changeViewcontroller(){
        
      /*  acknowledgement_controller = UIStoryboard.acknowledgement_Viewcontroller()
        centerNavigationController = UINavigationController(rootViewController:acknowledgement_controller)
        view.addSubview(centerNavigationController.view)
        addChild(centerNavigationController)
        centerNavigationController.didMove(toParent: self)
        */
        
    }
    
    
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
          
            changeViewcontroller()

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

