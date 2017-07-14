//
//  Brain.swift
//  Calc
//
//  Created by mohamed hisham on 7/10/17.
//  Copyright © 2017 hisham. All rights reserved.
//

import Foundation

struct Brain {
    
    
    private var accumulator :Double?
    
    private enum Operation {
        case constant (Double)
        case unary ((Double)-> Double)
        case binaryOperation ((Double,Double)-> Double)
        case equals
    }
    private var operations :Dictionary<String,Operation> =
        [
            "pi" : Operation.constant (Double.pi),
            "e"  : Operation.constant  (M_E)      ,
            "√"  : Operation.unary (sqrt),
            "cos" : Operation.unary(cos),
            "±" : Operation.unary({-$0}),
            "×": Operation.binaryOperation({$0*$1}),
            "+": Operation.binaryOperation({$0+$1}),
            "-": Operation.binaryOperation({$0-$1}),
            "/": Operation.binaryOperation({$0/$1}),
            "=" : Operation.equals,
           
            
            
    ]
    
  
    
    private var pbo : bindingBinaryOperation?
    private struct bindingBinaryOperation {
    
        let theOperation : (Double , Double ) -> Double
        let firstOperand : Double
        func preform(with secondOperand : Double) -> Double {
            return theOperation(firstOperand,secondOperand)
        }

    
    }
    
    
    mutating func preformOp (_ symbol :String)
    {
        if let operation = operations[symbol] // leh 3mlt if let 3shan mmkn el dic myb2ash feh el symbol ely anta b3to (null  pointer )
        {
            switch operation{
            case .constant(let value):
                accumulator = value
            case .unary( let function ) :
                if ( accumulator != nil){
                    accumulator = function(accumulator!)}
                
           case .binaryOperation (let function) :
               if ( accumulator != nil){
                pbo = bindingBinaryOperation(theOperation: function, firstOperand: accumulator!)
                accumulator = nil
                }
            case .equals :
                if ( accumulator != nil){
                   accumulator = pbo?.preform(with: accumulator!)} // el mfrod kant tb2a pbo! 3shan t force unwrap bs lma t3mlha pbo ? lw nill msh hy3ml 7aga
                    pbo = nil 
               
            
            }
                
                
                
                // in swift u dont need to break after every case coz once it enterend a case it exits after doing it without looking to the other cases
                
            }
        }
        
    
    
    mutating func setOperand(_ operand: Double) // 3shan t3rf swift an el method di htmutate el variable dah ely gwa el struct nfso, y3ni t3rf el struct an el function el gwah di ht3dl feh
    {
        
        accumulator = operand
        
    }
    
    
    //read only ( other classes will read only )
    
    var result:Double? {
        
        get{
            
            return accumulator
            
        }
        
    }
    
    

}
//struct is like a class but ( class have inhertance , struct not ) , classes live in heap ( ref types ) and u have pointers to them (dynamically allocated ) , structs are passed by copy (variable types )
// lma 7atyt var msh instialized fl struct m3trdsh leh ? , 3shan fl struct lma ykon f uninstialized vars by3mlha inshializing
