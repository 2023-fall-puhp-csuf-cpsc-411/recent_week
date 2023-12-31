//
//  PatternChecker.swift
//  week_7
//
//  Created by Mark D. Raden on 9/28/23.
//

import UIKit

class PatternChecker
{
    private var pattern_email = try! NSRegularExpression(
        pattern: #"^[0-9\\(\\)\\+\-]+$"#,
        options: []
    )
    
    private var pattern_phone = try! NSRegularExpression(
        pattern: #"^[0-9 \\(\\)\\+\-]+$"#,
        options: []
    )
    
    private func checkString(
        string: String,
        pattern: NSRegularExpression
    ) -> Bool
    {
        if string.isEmpty {
            return true
        }
        
        let match = pattern.matches(
            in: string,
            range: NSRange(0 ..< string.count)
        )
        let matches = !match.isEmpty
        
        return matches
    }
    
    public func checkEmailString(_ email: String) -> Bool
    {
        return self.checkString(
            string: email,
            pattern: self.pattern_email
        )
    }
    
    public func checkPhoneString(_ phone: String) -> Bool
    {
        return self.checkString(
            string: phone,
            pattern: self.pattern_phone
        )
    }
}
