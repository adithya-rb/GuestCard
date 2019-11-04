//
//  TextFieldEffects.swift
//  DemoBank
//
//  Created by Samkit on 11/30/16.
//  Copyright © 2016 SDL. All rights reserved.
//

import Foundation
import UIKit

protocol TextFieldsEffectsProtocol {
    func drawViewsForRect(_ rect: CGRect)
    func updateViewsForBoundsChange(_ bounds: CGRect)
    func animateViewsForTextEntry()
    func animateViewsForTextDisplay()
}

open class TextFieldEffects : UITextField, TextFieldsEffectsProtocol {
    
    let placeholderLabel = UILabel()
    
    func animateViewsForTextEntry() {
        fatalError("\(#function) must be overridden")
    }
    
    func animateViewsForTextDisplay() {
        fatalError("\(#function) must be overridden")
    }
    
    func drawViewsForRect(_ rect: CGRect) {
        fatalError("\(#function) must be overridden")
    }
    
    func updateViewsForBoundsChange(_ bounds: CGRect) {
        fatalError("\(#function) must be overridden")
    }
    
    override open func prepareForInterfaceBuilder() {
        drawViewsForRect(frame)
    }
    
    // MARK: - Overrides
    
    override open func draw(_ rect: CGRect) {
        drawViewsForRect(rect)
    }
    
    override open func drawPlaceholder(in rect: CGRect) {
        // Don't draw any placeholders
    }
    
    // MARK: - UITextField Observing
    
    override open func willMove(toSuperview newSuperview: UIView!) {
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(TextFieldEffects.textFieldDidEndEditing), name:NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
            
            NotificationCenter.default.addObserver(self, selector: #selector(TextFieldEffects.textFieldDidBeginEditing), name:NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    func animateTextField(textField: UITextField, up: Bool)
    {
        let movementDistance:CGFloat = -130
        let movementDuration: Double = 0.3
        
        var movement:CGFloat = 0
        if up
        {
            movement = movementDistance
        }
        else
        {
            movement = -movementDistance
        }
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        super.superview?.superview?.frame = (super.superview?.superview?.frame.offsetBy(dx: 0, dy: movement))!
        UIView.commitAnimations()
    }
    
    
    open func textFieldDidBeginEditing(textField: UITextField) {
        animateViewsForTextEntry()
        
        // Check below for KB animation
        //self.animateTextField(textField: textField, up:true)
        
    }
    
    open func textFieldDidEndEditing(textField: UITextField) {
        animateViewsForTextDisplay()
        // Check below for KB animation
        //self.animateTextField(textField: textField, up:false)
    }
    
}
