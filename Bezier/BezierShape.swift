//====================================================
import UIKit
//====================================================
class BezierShape: UIView {
    var path: UIBezierPath!
    //------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.0)
    }
    //------------------------------------------------
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    //------------------------------------------------
    override func draw(_ rect: CGRect) {
        path = UIBezierPath()
        createCircle()
        UIColor.orange.setFill()
        path.fill()
        UIColor.white.setStroke()
        path.lineWidth = 1.0
        path.stroke()
    }
    //------------------------------------------------
    func createCircle() {
        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
                                                y: 0.0,
                                                width: self.frame.size.height,
                                                height: self.frame.size.height))
    }
    //------------------------------------------------
}
//====================================================
