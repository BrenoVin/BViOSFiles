//
//  Created by Breno Vinicios Valadao on 03/11/15.
//  Copyright © 2015 Breno Vinicios Valadao. All rights reserved.
//


class BVCoreMotionEffects {

    func registerParallaxEffectForView(view:UIView, depth:CGFloat) {
    
        let effectx:UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.TiltAlongHorizontalAxis)
        let effecty:UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.TiltAlongVerticalAxis)
        
        effectx.maximumRelativeValue = depth
        effectx.minimumRelativeValue = -depth
        effecty.maximumRelativeValue = depth
        effecty.minimumRelativeValue = -depth
        
        aView.addMotionEffect(effectx)
        aView.addMotionEffect(effecty)
    
    }
}
