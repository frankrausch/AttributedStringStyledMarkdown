//
//  Created by Frank Rausch on 2021-11-15.
//

import UIKit

// This is just a view that draws an NSAttributedString.
class DrawView: UIView {
    var attributedText: NSAttributedString? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        attributedText?.draw(in: bounds)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
}
