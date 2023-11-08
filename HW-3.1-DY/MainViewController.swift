//
//  ViewController.swift
//  HW-3.1-DY
//
//  Created by Denis Yarets on 08/11/2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {
    
    @IBOutlet weak var viewSpring: SpringView!
    @IBOutlet weak var labelParameters: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    var nextAnimation = (preset: 0, curve: 0)
    var animationPreset = AnimationPreset.allCases.first
    var animationCurve = AnimationCurve.allCases.first
    let animationDuration = 0.35
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSpring.layer.cornerRadius = 15
        generateSpringAnimation()
        setDescriptions()
        runAnimation()
    }

    
    @IBAction func buttonPressed() {
        generateSpringAnimation()
        setDescriptions()
        runAnimation()
    }
    
}

private extension MainViewController {
    
    func runAnimation() {
        if let preset = animationPreset?.rawValue, let curve = animationCurve?.rawValue {
            viewSpring.animation = preset
            viewSpring.curve = curve
            viewSpring.duration = animationDuration
            viewSpring.animate()
        }
    }
    
    func setDescriptions() {
        if
            let preset = animationPreset?.rawValue,
            let curve = animationCurve?.rawValue
        {
            labelParameters.text = "Current animation: \(preset)\nAnimation curve: \(curve)\nDuration time: \(animationDuration)"
            button.setTitle(AnimationPreset.allCases[nextAnimation.preset].rawValue, for: .normal)
        }
    }
    
    func generateSpringAnimation() {
        animationPreset = AnimationPreset.allCases[nextAnimation.preset]
        animationCurve = AnimationCurve.allCases[nextAnimation.curve]
        
        let indexPreset = Int.random(in: 0..<AnimationPreset.allCases.count)
        let indexCurve = Int.random(in: 0..<AnimationCurve.allCases.count)
        
        nextAnimation = (indexPreset, indexCurve)
    }
    
}
