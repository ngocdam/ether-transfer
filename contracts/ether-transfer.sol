import "owned.sol";
import "am-on-the-fork.sol";

contract EtherTransfer is Owned{

    //"If you are good at something, never do it for free" - Joker
    //Fee is 0.05% (it's mean you send 1 ETH fee is 0.0005 ETH)
    uint constant Fee = 5;
    uint constant Decs = 10000;

    //Is Vitalik Buterin on the Fork ? >_<
    AmIOnTheFork IsHeOnTheFork = AmIOnTheFork(0x2bd2326c993dfaef84f696526064ff22eba5b362);

    //Only send ETH
    function SendETH(address ETHAddress) returns(bool){
        if(IsHeOnTheFork.forked() && ETHAddress.send(msg.value - (msg.value*Fee/Decs))){
            return true;
        }
        //No ETC is trapped
        throw;
    }

    //Only send ETC
    function SendETC(address ETCAddress) returns(bool){
        if(!IsHeOnTheFork.forked() && ETCAddress.send(msg.value - (msg.value*Fee/Decs))){
            return true;
        }
        //No ETH is trapped
        throw;
    }

    //I get rich lol, ez
    function WithDraw() OnlyOwner returns(bool){
        if(this.balance > 0 && Owner.send(this.balance)){
            return true;
        }
        throw;
    }

}