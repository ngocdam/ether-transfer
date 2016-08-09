contract Owned{

    //Address of owner
    address Owner;

    //Add modifier
    modifier OnlyOwner{if(msg.sender == Owner)_}

    //Contruction function
    function Owned(){
        Owner == msg.sender;
    }

}