//
//  CookViewController.swift
//  SavoryPlus
//
//  Created by Ted on 5/7/16.
//  Copyright © 2016 savoryplus.SavoryPlus. All rights reserved.
//

import UIKit

class CookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pickerOutlet: UIPickerView!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func sliderControl(sender: AnyObject) {
        let countingColor = CGFloat(round(sliderOutlet.value)*1/1)
        tempLabel.text = "烹調溫度 : \(round((sliderOutlet.value)*10)/10)度"
        let useThisColor = UIColor.init(red: (countingColor+30)/255, green: (166+countingColor/4)/255, blue: (35+countingColor/3)/255, alpha: 1)
        sliderOutlet.minimumTrackTintColor = useThisColor
        sliderOutlet.thumbTintColor = useThisColor
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOutlet.delegate = self
        pickerOutlet.dataSource = self
        //        pickerOutlet.tintColor = UIColor.init(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
        sliderOutlet.maximumTrackTintColor = UIColor.lightGrayColor()
        sliderOutlet.thumbTintColor = UIColor.init(red: 30/255, green: 166/255, blue: 35/255, alpha: 1)

        sliderOutlet.minimumValue = 10
        sliderOutlet.maximumValue = 220
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return thisPickerData.count
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return thisPickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return thisPickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel!
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            //color the label's background
            pickerLabel.backgroundColor = UIColor.init(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
        }
        let titleData = thisPickerData[component][row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 22.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .Center
        return pickerLabel
    }
    
 
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        updateLabel()
    }
    

    
    func updateLabel(){
        let hour = thisPickerData[0][pickerOutlet.selectedRowInComponent(0)]
        let minute = thisPickerData[1][pickerOutlet.selectedRowInComponent(1)]
        timeLabel.text = "預計烹調 " + hour + " " + minute
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SetCook" {
            let destController = segue.destinationViewController as! OnCookViewController
            destController.temperature = round((sliderOutlet.value)*10)/10
            destController.timeHour = pickerOutlet.selectedRowInComponent(0)
            destController.timeMinute = pickerOutlet.selectedRowInComponent(1)
//            destController.tempFoodImageData = createFakeArrayData[indexPath.row].image
            
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
