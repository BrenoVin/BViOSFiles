//
//  Created by Breno Vinicios Valadao on 29/10/15.
//  Copyright © 2015 Breno Vinicios. All rights reserved.
//

import Foundation

protocol TimerUpdateValue:class {
   
    func newValueForTimer(timerValue:String,totalValueInSeconds:Int!)
    func timerOver(timeOut:Bool)

}

class BVTimer {
    
    weak var delegate:TimerUpdateValue!
    
    private var timer:NSTimer = NSTimer()
    
    private var time:Int!
    private var timeFormatted:String!

    ///
    func cas_startTimerWithTimeInMinutes(minutes:Int!){
        self.time = minutosParaSegundos(minutes)
        
        self.updateNewValueForTimer()
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
        
    }
    func cas_stopTimer(){
        self.timer.invalidate()
        
    }
    
    private func minutosParaSegundos(minutos:Int!) -> Int!{
        return (minutos * 60)
    }
    
    private func segundosParaPadraoDoSimulado(tempo:Int!)->String{
        
        let minutos = tempo/60
        let segundos = tempo%60
        
        //retonar o valor formatado corretamente
        if segundos < 10 && minutos < 10 {
            return ("0\(minutos):0\(segundos)")
        }else if segundos < 10 {
            return ("\(minutos):0\(segundos)")
        }else if minutos < 10 {
            return ("0\(minutos):\(segundos)")
        }else{
            return ("\(minutos):\(segundos)")
        }
    }
    
    private func updateNewValueForTimer(){
        self.timeFormatted = segundosParaPadraoDoSimulado(self.time)
        self.newValueForTimer(self.timeFormatted,totalValueInSeconds: self.time)
    }
    
    //mark - update timer
    @objc private func updateTimer(){
        if(self.time > 0){
            self.time = self.time - 1
            self.updateNewValueForTimer()
        }else{
            self.timer.invalidate()
            self.timerOver(true)
        }
    }
    
    // mark - delegate methods
    func newValueForTimer(timerValue:String, totalValueInSeconds:Int!){
        delegate.newValueForTimer(timerValue,totalValueInSeconds: totalValueInSeconds)

    }
    func timerOver(timeOut:Bool){
        delegate.timerOver(timeOut)

    }
}