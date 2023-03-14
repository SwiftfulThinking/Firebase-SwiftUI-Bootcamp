//
//  OnFirstAppearViewModifier.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Nick Sarno on 1/22/23.
//

import Foundation
import SwiftUI

struct OnFirstAppearViewModifier: ViewModifier {
    
    @State private var didAppear: Bool = false
    let perform: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .onAppear {
                if !didAppear {
                    perform?()
                    didAppear = true
                }
            }
    }
}

extension View {
    
    func onFirstAppear(perform: (() -> Void)?) -> some View {
        modifier(OnFirstAppearViewModifier(perform: perform))
    }
    
}
