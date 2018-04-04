pragma solidity ^0.4.4;
contract GetAddressByPubKey {
    bytes tmp = new bytes(64);
    
    function getAddress(bytes publicKey)public returns(address){
        uint i=0;
        
        uint len = publicKey.length;
        if (publicKey.length > 64){
            for(i=len - 64;i<len;i++){
                tmp[i-1] = publicKey[i];
            }
        }else{
            
            for(i=0; i<len; i++){
                tmp[i] = publicKey[i];
            }
            //padding zero that is not 64 bytes 
            for(i=tmp.length-1; i>=len; i--){
                tmp[i] = 0;
            }
        }
        return address(keccak256(tmp));
    }
}
