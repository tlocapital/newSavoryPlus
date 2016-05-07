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
            tempLabel.text = "烹調溫度 : \(round((sliderOutlet.value)*10)/10)度"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOutlet.delegate = self
        pickerOutlet.dataSource = self
        sliderOutlet.minimumTrackTintColor = UIColor.orangeColor()
        sliderOutlet.maximumTrackTintColor = UIColor.lightGrayColor()

        sliderOutlet.minimumValue = 1
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
            
            destController.time = [thisPickerData[0][pickerOutlet.selectedRowInComponent(0)],thisPickerData[1][pickerOutlet.selectedRowInComponent(1)]]
            

            
//            destController.tempFoodImageData = createFakeArrayData[indexPath.row].image
            
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
