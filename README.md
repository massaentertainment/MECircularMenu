CircularMenu
============

## About
This project is mantained by **Massa Entertainment**.<br>
The team is composed by

**Gabriel B. Valério**
iOS Developer

**Kayan Lucas**
Mobile Designer

## What is it?
This framework is a easy-to-use CircularMenu focused on iOS UIKit-based applications. The code was written entirely in Swift 3.

## How to use?

In this case, we will be using the datasource and the delegate on the ViewController.

```swift
class ViewController: UIViewController {

    let activeImages = [
        #imageLiteral(resourceName: "active_0"),
        #imageLiteral(resourceName: "active_1"),
        #imageLiteral(resourceName: "active_2"),
        #imageLiteral(resourceName: "active_3"),
        #imageLiteral(resourceName: "active_0"),
        #imageLiteral(resourceName: "active_1"),
        #imageLiteral(resourceName: "active_2")
    ]

    let inactiveImages = [
        #imageLiteral(resourceName: "inactive_0"),
        #imageLiteral(resourceName: "inactive_1"),
        #imageLiteral(resourceName: "inactive_2"),
        #imageLiteral(resourceName: "inactive_3"),
        #imageLiteral(resourceName: "inactive_0"),
        #imageLiteral(resourceName: "inactive_1"),
        #imageLiteral(resourceName: "inactive_2")
    ]

}
```

But, first of all, you must have a MECircularMenuDataSource protocol implemented, remembering that even we setting all the methods, all of then are optionals:

```swift
extension ViewController : MECircularMenuDataSource {

	//The number of buttons on the circular menu.
    func numberOfButtons(in circularMenu:MECircularMenuView) -> Int {
        return 7
    }
    
    //The proportion of the size of the center circle.
    //This is the default value.
    func proportionForCenterCircle(in circularMenu:MECircularMenuView) -> CGFloat {
        return 1/3.5
    }
    
    //This is the image that appears when the button is active.
    func circularMenu(_ circularMenu:MECircularMenuView, activeImageForButtonIndex index:Int) -> UIImage? {
        return activeImages[index]
    }
    
    //This is the image that appears when the button is inactive.
    func circularMenu(_ circularMenu:MECircularMenuView, inactiveImageForButtonIndex index:Int) -> UIImage? {
        return inactiveImages[index]
    }
    
    //This method is called when some button is clicked.
    func circularMenu(_ circularMenu: MECircularMenuView, didSelectedButtonAt index: Int) {
        print("Did select \(index)")
    }
    
    //This methods returns a image that stays in the center of the circle when it is closed.
    func closedImageForCenterCircle(in circularMenu:MECircularMenuView) -> UIImage? {
        return nil
    }
    
    //This methods returns a image that stays in the center of the circle when it is open.
    func openedImageForCenterCircle(in circularMenu:MECircularMenuView) -> UIImage? {
        return #imageLiteral(resourceName: "opened_icon")
    }
    
    //This method returns a properties dictionary of [String:Any] with the following customizable constants for the button on a specific index:
    //kCircularMenuButtonStrokeColor -> Border UIColor of the button.
    //kCircularMenuButtonFillColor -> Background UIColor of the button.
    func circularMenu(_ circularMenu:MECircularMenuView, propertiesForButtonIndex index:Int) -> [String:Any] {
        return [kCircularMenuButtonFillColor: UIColor.white,
                kCircularMenuButtonStrokeColor: UIColor.white]
    }
}
```

After setting up the dataSource, we now can instantiate and add to the view our ```MECircularMenu```:

```swift
class ViewController: UIViewController {
    
    //Assets on the demo project.
    let activeImages = [
        #imageLiteral(resourceName: "active_0"),
        #imageLiteral(resourceName: "active_1"),
        #imageLiteral(resourceName: "active_2"),
        #imageLiteral(resourceName: "active_3"),
        #imageLiteral(resourceName: "active_0"),
        #imageLiteral(resourceName: "active_1"),
        #imageLiteral(resourceName: "active_2")
    ]
    
    let inactiveImages = [
        #imageLiteral(resourceName: "inactive_0"),
        #imageLiteral(resourceName: "inactive_1"),
        #imageLiteral(resourceName: "inactive_2"),
        #imageLiteral(resourceName: "inactive_3"),
        #imageLiteral(resourceName: "inactive_0"),
        #imageLiteral(resourceName: "inactive_1"),
        #imageLiteral(resourceName: "inactive_2")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        //Remembering that the width must be equals the height.
        let circMenu = MECircularMenuView(frame: CGRect(x: 50, y: 50, width: 140, height: 140), dataSource: self)

        //Setting the delegate (conformed right below).
        circMenu.delegate = self

        //Setting a custom color to the centerCircle.
        circMenu.centerCircle.backgroundColor = UIColor(colorLiteralRed: 0.5412, green: 0.8706, blue: 0.6824, alpha: 1.0)
        view.addSubview(circMenu)
    }

}
```

Setting the delegate up and also remembering that all the methods are optionals:

```swift
extension ViewController : MECircularMenuDelegate {

	func circularMenuDidOpen(_ circularMenu: MECircularMenuView){
    	print("Did open")
    }
    
    func circularMenuWillOpen(_ circularMenu: MECircularMenuView) {
        print("Will open")
    }
    
    func circularMenuDidClose(_ circularMenu: MECircularMenuView) {
        print("Did close")
    }
    
    func circularMenuWillClose(_ circularMenu: MECircularMenuView) {
        print("Will close")
    }

}

```

You should have something like this:

![](https://raw.githubusercontent.com/massaeentertainment/MECircularMenu/master/Screenshots/circm.gif)

## Contributing

Feel free to contact us and give some forks, feedbacks and patches.

## Contact

Email:
massaentertainmentdev@gmail.com

## License

This FW is distributed under MIT License.
