import "@stdlib/deploy";
import "@stdlib/ownable";


contract SendCoins with Deployable, Ownable {

    owner: Address;

    init() {
        self.owner = sender();
    }

    // accept incoming TON transfers
    

    // this will withdraw the entire balance of the contract and leave 0
    receive("withdraw all") {
        self.requireOwner();
        
        send(SendParameters{
            to: sender(),
            bounce: true,
            value: 0,
            mode: SendRemainingBalance 
        });
    }
    receive() {
        dump("funds received yay");
    }

    // this will withdraw a specific amount but leave 0.01 for storage rent costs

 
    get fun balance(): String {
        return myBalance().toCoinsString();
    }
}
