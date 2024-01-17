Function checkIfNumber($value){
    try{
        [int]$value 
        return $value
    }catch{
        Write-Host Not a number
        return [string]$value
    }
    write-host hello world
}

function calculate($operator){
    switch($operator){
        '+'
        {
            ## write-host $value1 
            $result = $value1 + $value2
            write-host $result
        }
        '-'
        {
            $result = $value1 - $value2
            write-host $result
        }
        '*'
        {
            $result = $value1 * $value2           
            write-host $result
        } 
        '\'
        {
            try{
                $result = [math]::round($value1 / $value2,2)
                write-host $result
                }catch{
                    write-host Cannot divide by Zero
                }
        }
    }        
}

function  Invoke-RoundDecimal{
    [cmdletbinding()]
    Param(
          [Parameter(madatory)][double]$double
    )
    
            
}

$value1
$value2

$operators = @{}
$operators.add('+', $true)
$operators.add('-', $true)
$operators.add('*', $true)
$operators.add('\', $true)
$continue = 'Y'

while($continue -eq 'Y'){

    do{
       $value = read-host Enter First number
       $value1 = checkIfNumber($value)
       $value1 = $value1[0]    
    }while($value1.getType() -ne [int])

    do{
       $value = read-host Enter Second number
       $value = checkIfNumber($value)
       $value2 = $value[0]
    }while($value2.getType() -ne [int])


    do{
        $operator = read-host -Prompt "Enter operator [+,-,*,\]"
        if(!($operators[$operator])){
            write-host Didnt choose an operator
        }
    }while(!($operators[$operator]))
    
    calculate($operator)    
    
    $continue = read-host 'Continue? Y/N' 
}