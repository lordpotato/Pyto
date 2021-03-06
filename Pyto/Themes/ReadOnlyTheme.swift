//
//  ReadOnlyTheme.swift
//  Pyto
//
//  Created by Adrian Labbé on 1/17/19.
//  Copyright © 2019 Adrian Labbé. All rights reserved.
//

import SavannaKit
import SourceEditor

/// A theme used for previews.
struct ReadonlyTheme: SourceCodeTheme {
    
    let defaultTheme: SourceCodeTheme
    
    /// Initializes the theme.
    ///
    /// - Parameters:
    ///     - theme: Base theme.
    init(_ theme: SourceCodeTheme) {
        defaultTheme = theme
    }
    
    var lineNumbersStyle: LineNumbersStyle? {
        return nil
    }
    let gutterStyle = GutterStyle(backgroundColor: .clear, minimumWidth: 0)
    var font: Font {
        return defaultTheme.font
    }
    var backgroundColor: Color {
        #if os(macOS)
        if defaultTheme.backgroundColor != .white {
            return defaultTheme.backgroundColor
        } else {
            return NSColor(deviceWhite: 0.9, alpha: 1)
        }
        #else
        return defaultTheme.backgroundColor
        #endif
    }
    func color(for syntaxColorType: SourceCodeTokenType) -> Color {
        return defaultTheme.color(for: syntaxColorType)
    }
    func globalAttributes() -> [NSAttributedString.Key : Any] {
        return defaultTheme.globalAttributes()
    }
}
