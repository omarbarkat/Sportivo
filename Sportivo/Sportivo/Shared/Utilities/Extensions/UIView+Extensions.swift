import UIKit
import Foundation

// MARK: - Designable Extension
extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}

extension UILabel {
    func underlineLBL() {
        if let textString = self.text {
          let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
          attributedText = attributedString
        }
    }
}

extension UIButton {
    func underline() {
        if let textString = self.titleLabel?.text {
            let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: (textString.count)))
            self.setAttributedTitle(attributedString, for: .normal)
        }
    }
}
//@IBDesignable
extension UIView {
//    @IBInspectable
//    var cornerRadiusForUIView: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
    @IBInspectable
    /// Should the corner be as circle
    public var circleCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    @IBInspectable
    /// Shadow color of view; also inspectable from Storyboard.
    public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    /// Shadow offset of view; also inspectable from Storyboard.
    public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    /// Shadow opacity of view; also inspectable from Storyboard.
    public var shadowOpacity: Double {
        get {
            return Double(layer.shadowOpacity)
        }
        set {
            layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable
    /// Shadow radius of view; also inspectable from Storyboard.
    public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    /// Shadow path of view; also inspectable from Storyboard.
    public var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set {
            layer.shadowPath = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowShouldRasterize: Bool {
        get {
            return layer.shouldRasterize
        }
        set {
            layer.shouldRasterize = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowRasterizationScale: CGFloat {
        get {
            return layer.rasterizationScale
        }
        set {
            layer.rasterizationScale = newValue
        }
    }
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    func anchor(top :NSLayoutYAxisAnchor? , left : NSLayoutXAxisAnchor? , right : NSLayoutXAxisAnchor? , bottom : NSLayoutYAxisAnchor? , paddingtop : CGFloat , paddingleft : CGFloat , paddingright : CGFloat , paddingbottom : CGFloat , width : CGFloat , height : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingtop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingleft).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingright).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingbottom).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}


// MARK: - Properties

public extension UIView {
    
    /// Size of view.
     var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    /// Width of view.
     var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// Height of view.
     var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
}

extension UIView {
    
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: T.self) }
    }
    
    
}


// MARK: - Methods

public extension UIView {
    
     typealias Configuration = (UIView) -> Swift.Void
    
     func config(configurate: Configuration?) {
        configurate?(self)
    }
    
    /// Set some or all corners radiuses of view.
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
//     func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let shape = CAShapeLayer()
//        shape.path = maskPath.cgPath
//        layer.mask = shape
//    }
}

extension UIView {
    
    func searchVisualEffectsSubview() -> UIVisualEffectView? {
        if let visualEffectView = self as? UIVisualEffectView {
            return visualEffectView
        } else {
            for subview in subviews {
                if let found = subview.searchVisualEffectsSubview() {
                    return found
                }
            }
        }
        return nil
    }
    
    /// This is the function to get subViews of a view of a particular type
    /// https://stackoverflow.com/a/45297466/5321670
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    
    
    /// This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T
    /// https://stackoverflow.com/a/45297466/5321670
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}

extension UIView{
    
    @IBInspectable var bottomLeftRoundedCorners: Bool {
        get {
            return false
        }
        set {
            roundCorners(radius: 10 , pos : [ .layerMaxXMinYCorner , .layerMinXMinYCorner , .layerMinXMaxYCorner])
        }
    }
    @IBInspectable var bottomRightRoundedCorners: Bool {
        get {
            return false
        }
        set {
            roundCorners(radius: 10 , pos : [ .layerMaxXMaxYCorner , .layerMaxXMinYCorner , .layerMinXMinYCorner ])
        }
    }
    @IBInspectable var bottomRoundedCorners: Bool {
        get {
            return false
        }
        set {
            roundCorners(radius: 10 , pos : [ .layerMaxXMaxYCorner , .layerMinXMaxYCorner])
        }
    }
    @IBInspectable var topRoundedCorners: Bool {
        get {
            return false
        }
        set {
            roundCorners(radius: 10 , pos : [ .layerMinXMinYCorner , .layerMaxXMinYCorner  ])
        }
    }
    
    func roundCorners(radius: CGFloat, pos : CACornerMask) {
                clipsToBounds = true
                layer.cornerRadius = radius
                layer.maskedCorners = pos
        }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    
    @IBInspectable var borderColor: UIColor {
        get {
            return self.borderColor
        }
        set {
            self.addBorderColor(color: newValue)
        }
        
    }
    func addBorderColor(color: UIColor )
    {
        //self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        
    }
    
    //Allow to add shadow of any View from story board attributes
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                     shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                     shadowOpacity: Float = 0.4,
                     shadowRadius: CGFloat = 3.0) {
          layer.shadowColor = shadowColor
          layer.shadowOffset = shadowOffset
          layer.shadowOpacity = shadowOpacity
          layer.shadowRadius = shadowRadius
      }
      
    
    //Allow to change the corner radius of any View from story board attributes
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

  
    
    override open func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    
    
}

extension UIView {

    func createDashedLine(from point1: CGPoint, to point2: CGPoint, color: UIColor, strokeLength: NSNumber, gapLength: NSNumber, width: CGFloat) {
        let shapeLayer = CAShapeLayer()

        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineDashPattern = [strokeLength, gapLength]

        let path = CGMutablePath()
        path.addLines(between: [point1, point2])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    private static let lineDashPattern: [NSNumber] = [2, 2]
       private static let lineDashWidth: CGFloat = 1.0

       func makeDashedBorderLine() {
           let path = CGMutablePath()
           let shapeLayer = CAShapeLayer()
           shapeLayer.lineWidth = UIView.lineDashWidth
           shapeLayer.strokeColor = UIColor.red.cgColor
           shapeLayer.lineDashPattern = UIView.lineDashPattern
           path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height/2),
                                   CGPoint(x: bounds.maxX, y: bounds.height/2)])
           shapeLayer.path = path
           layer.addSublayer(shapeLayer)
       }
}
