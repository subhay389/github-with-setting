//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Sudheesh Bhattarai on 3/3/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var countLabel: UILabel!
    var minStars: Int!
    var copyMinStars: Int!
    
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        self.settings.minStars = Int(self.slider.value)
        self.delegate?.didSaveSettings(settings: self.settings)
        self.dismiss(animated: true, completion: nil)
        
    }
     
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("Cancel button pressed")
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    
        
        
    }
    
    @IBAction func slider(_ sender: Any) {
        
        //print("The slider is been changed")
        countLabel.text = "\(Int(slider.value))"
        settings.minStars = Int(slider.value)
    }
    
    var settings = GithubRepoSearchSettings()
    weak var delegate : SettingsPresentingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 20000
        // Dispose of any resources that can be recreated.
        
        slider.value = Float(settings.minStars)
        countLabel.text = "\(Int(settings.minStars))"

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
