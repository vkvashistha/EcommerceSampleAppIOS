//
//  BaseViewController.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 10/07/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startTracking(viewController: self)
    }
    
    func startTracking(viewController : UIViewController?) {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        //        tap.delegate = GestureRecognizerDelegate(tap: tap)
        //        tap.delegate = self
        tap.cancelsTouchesInView = false
        if let view = viewController?.view {
            view.addGestureRecognizer(tap)
        }
        /*    let childViews = viewController?.view.subviews
         if(childViews != nil) {
         
         addClickListener(childViews!)
         
         }
         */
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        if let view = sender?.view {
            let point = sender?.location(in: nil)
            let childViews = view.subviews
            if(point != nil) {
                if let targetView = getTargetView(childViews, point!) {
                    let desc = getDescription(targetView)
                    print("Tapped : \(desc)")
                    
                } else {
                    print("Target view is null")
                }
            }
        } else {
            print("handleTap :-> Unable to get the view, sender?.view is nil")
        }
    }
    
    func getDescription(_ view : UIView) -> String {
        if(view is UILabel) {
            return (view as! UILabel).text ?? "undefined"
        } else if(view is UIButton) {
            return (view as! UIButton).titleLabel?.text ?? "undefined"
        } else if(view is UISlider) {
            return "UISlider Value: \(String(describing:(view as! UISlider).value))"
        } else if(view is UISwitch) {
            let uiswitch = view as! UISwitch
            return "State : \(uiswitch.isOn ? "on" : "off")"
        } else if(view is UIImageView) {
            let uiImageView = view as!UIImageView
            return "tag:\(uiImageView.tag)"
        } else if(view is UIButton) {
            let uiButton = view as! UIButton
            return uiButton.titleLabel?.text ?? "undrefined"
        } else {
            let views = view.subviews
            let viewType = String(describing: type(of: view))
            var desc = "{\(viewType):{"
            for subview in views {
                desc = desc + "\(String(describing:type(of: subview.self))) : \(getDescription(subview)),"
            }
            desc = desc + "}}"
            return desc
        }
    }
    
    func getTargetView(_ views:[UIView], _ point:CGPoint) -> UIView? {
        for view in views {
            let globalRect = view.convert(view.bounds, to: nil)
            //            print("bounds : \(globalRect), point:\(point), view:\(view)")
            if(globalRect.contains(point)) {
                if (view is UIControl || view.superview is UICollectionView ||  view.superview is UITableView || (!(view is UIScrollView) && containsTapGestureRecogniser(gestureRecognizers: view.gestureRecognizers))) {
                    return view
                }
                else {
                    return getTargetView(view.subviews, point)
                }
            }
        }
        return nil
    }
    
    func containsTapGestureRecogniser(gestureRecognizers : [UIGestureRecognizer]?) -> Bool {
//        if(gestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>, shouldRecognizeSimultaneouslyWith: <#T##UIGestureRecognizer#>))
        if (gestureRecognizers == nil) {
            return false
        }
        for gestureRecongizer in gestureRecognizers! {
            if(gestureRecongizer is UITapGestureRecognizer) {
                return true
            }
        }
        return false
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
