//
//  PinCodeTimer.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/2/24.
//

import SwiftUI
import Combine

@Observable
class BaseViewModel {
    var cancellableSet: Set<AnyCancellable> = .init([])
}

@Observable
final class PinCodeTimer: BaseViewModel {
    var seconds: Int = 60
    private var timer: Publishers.Autoconnect<Timer.TimerPublisher>? = nil
    
    func startTimer() {
        if timer == nil {
            timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
            subscribeToTimer()
        }
    }
    
    func resetTimer() {
        seconds = 60
    }
    
    private func subscribeToTimer() {
        timer?
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.seconds > 0 {
                    self.seconds -= 1
                } else {
                    timer = nil
                }
            }
            .store(in: &cancellableSet)
    }
}
