//
//  ViewController.swift
//  MemeMaker
//
//  Created by Student on 2020-05-12.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let coolOption = CaptionOption(emoji: "🕶", caption: "You know what's cool?")
        let madOption = CaptionOption(emoji: "💥", caption: "You know what makes me mad?")
        let loveOption = CaptionOption(emoji: "💕", caption: "You know what I love?")
        
        topChoices = [coolOption, madOption, loveOption]
        topCaptionSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        
        let catOption = CaptionOption(emoji: "🐱", caption: "Cat's wearing hats.")
        let dogOption = CaptionOption(emoji: "🐕", caption: "Dog's carrying logs.")
        let monkeyOption = CaptionOption(emoji: "🐒", caption: "Monkey's being funky.")
       
        bottomChoices = [catOption, dogOption, monkeyOption]
        bottomCaptionSegmentedControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        updateLabels()
    }

    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    
    @IBAction func choiceSelected(_ sender: Any) {
        updateLabels()
    }
    
    func updateLabels() {
        let topIndex = topCaptionSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        
        topCaptionLabel.text = topChoice.caption
        bottomCaptionLabel.text = bottomChoice.caption
    }
    
    var topChoices = [CaptionOption]()
    var bottomChoices = [CaptionOption]()
}

