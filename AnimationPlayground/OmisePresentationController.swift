
import UIKit

class OmisePresentationController: UIPresentationController {
    
    override func presentationTransitionWillBegin() {
        
        guard let containerView = containerView,
            let presentedView = presentedView() else {
                return
        }
        
        containerView.addSubview(presentedView)
        
    }
    
}