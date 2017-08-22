//========================================
import UIKit
//========================================
class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var angle: UITextField!
    var shape: BezierShape!
    var xPos: CGFloat = 0
    var yPos: CGFloat = 0
    var timer: Timer!
    var steps = 0
    var defaultX: CGFloat!
    var defaultY: CGFloat!
    var arrayOfAngles: [Double] = []
    //------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        angle.text = String(0.0)
        angle.textColor = UIColor.darkGray
        fillArrayOfAngles()
    }
    //------------------------------------
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = CGFloat(10)
        let height: CGFloat = CGFloat(10)
        let xPos = self.view.frame.size.width/2 - width/2
        let yPos = CGFloat(185)
        shape = BezierShape(frame: CGRect(x: xPos, y: yPos, width: width, height: height))
        self.view.addSubview(shape)
        defaultX = shape.center.x
        defaultY = shape.center.y
    }
    //------------------------------------
    func fillArrayOfAngles() {
        var theAngle = 0.0
        for _ in 0...31 {
            arrayOfAngles.append(theAngle)
            theAngle += 11.25
        }
    }
    //------------------------------------
    @objc func sinCosAnimation() {
        if steps >= 384 {
            timer.invalidate()
            steps = 0
        }
        let angleInDegrees: Double = Double(angle.text!)!
        steps = steps + 1
        xPos = xPos + CGFloat(__cospi(angleInDegrees/180.0)) / 500
        yPos = yPos + CGFloat(__sinpi(angleInDegrees/180.0)) / 500
        shape.center.x += xPos
        shape.center.y += yPos
    }
    //------------------------------------
    @IBAction func animate(_ sender: UIButton) {
        xPos = 0
        yPos = 0
        shape.center.x = defaultX
        shape.center.y = defaultY
        steps = 0
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self,
                                     selector: (#selector(ViewController.sinCosAnimation)),
                                     userInfo: nil, repeats: true)
    }
    //------------------------------------
    @IBAction func hideKeyboard(_ sender: UIButton) {
        angle.resignFirstResponder()
    }
    //------------------------------------
    @IBAction func randomAngle(_ sender: UIButton) {
        let randomAngle = arc4random_uniform(UInt32(arrayOfAngles.count))
        angle.text = String(arrayOfAngles[Int(randomAngle)])
    }
    //------------------------------------
}
//========================================










