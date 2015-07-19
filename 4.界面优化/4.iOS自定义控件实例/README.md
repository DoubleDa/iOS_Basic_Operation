#4.4:iOS自定义控件实例
	**本课程讲解自定义控件的用法。**
	*课程背景：任何一个技术，官方提供的控件只是标准控件，所以我们必须要学会如何自定义控件，才能写出适合自己实际项目的控件。*
	#1.配置iOS自定义控件属性 03:47
		本课时通过配置控件属性的方式自定义控件。
			button (背景图片 图标图片)
	#2.自定义圆形进度指示控件实例 13:04
		本课时通过自定义控件实例讲解该控件的用法。
	#3.实时预览自定义控件效果 09:01
		本课时讲解使用Xcode6的最新工具实时预览自定义控件的效果。
			将其在attribute上面显示
			新建target 然后建立一个file
		```Swift
			import UIKit

			@IBDesignable class MyView: UIView {

			    override init(frame: CGRect) {
			        super.init(frame: frame)
			    }
			    required init(coder aDecoder: NSCoder) {
			        super.init(coder: aDecoder)
			    }
			    
			    @IBInspectable var str:String = "Hello"
			    @IBInspectable var borderWidth:CGFloat = 0{
			        didSet{
			            layer.borderWidth = borderWidth
			        }
			    }
			    @IBInspectable var borderColor:UIColor = UIColor.clearColor(){
			        didSet{
			            layer.borderColor = borderColor.CGColor
			        }
			    }
			    @IBInspectable var cornerRadius:CGFloat = 0{
			        didSet{
			            layer.cornerRadius = cornerRadius
			        }
			    }
			}    
		```