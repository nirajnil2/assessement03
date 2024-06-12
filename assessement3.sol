

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 ;

contract tansact{
     uint public value;

     function setvalue(uint _newvalue) public {
        require(_newvalue!=0,"New value will not be  zero");
     

      // Using assert to check invariants
      assert(_newvalue!= 10);
       value = _newvalue;

     }
     
    function incrementvalue(uint delta) public {
        if(delta>100){
            revert("delta value is too large");
        }
        value+=delta;
    }
}

