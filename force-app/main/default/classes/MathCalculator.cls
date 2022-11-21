// Apex Hours Assignment 2 //

public class MathCalculator{
    
    private static integer add(Integer num1, Integer num2){
        
        Integer addResult  = num1 + num2;
        return addResult;
    }
    
    private static integer multiply(Integer num1, Integer num2){
        
        Integer multiplyResult  = num1 * num2;
        return multiplyResult;
    }
    
    private static integer subtract(Integer num1, Integer num2){
        
        Integer subtractionResult;
        
        if (num1 > num2){
            subtractionResult   = num1 - num2;
        } else{
            subtractionResult = num2 - num1;
        }
        
        return subtractionResult;
    }
    
    private static void printOutput(Integer addOutput, Integer multiplyOutput, Integer subtractionOutput){
        System.debug('add result:- ' + addOutput);
        System.debug('multiply result:- ' + multiplyOutput);
        System.debug('Subraction result:- ' + subtractionOutput);
    }
    
    public void doMath(integer num1, integer num2){
        integer addOutput = add(num1, num2);
        integer multiplytOutput = multiply(num1, num2);
        integer subtractionOutput = subtract(num1, num2);
        printOutput(addOutput, multiplytOutput, subtractionOutput);
    }
    
}