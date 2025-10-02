//SPDX-lİCENSE-Identifier: MIT 
pragma solidity ^0.8.18;

contract MyToken {
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(addresss => uint256 public balanceOf);
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address inedxed owner, address inedxed spender, uint256 value);

     constructor(uint256 initialsupply) {
        totalSupply = initialSupply * 10**uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);

     }

     function transfer(address to, uint526 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Not enough balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to value);
        return true;

     }

     function approve(address spender, uint256 value) public returns(bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
     }

     function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(balanceOf)[from] >=, "Not enough balance");
        require(allowance[from][msg.sender] >= value, "Allowance too low");
        balanceOf[from] -= value;
        allowance[from][msg.sender] -= vaule;
        balanceOf[to] += value;
        emit Transfer(from, to value);
        return true;

     }


}

// Simple DEX 


contract SimpleDEX {
    MyToken public token;
    uint256 public tokenReserve;
    uint256 public ethReserve;

    constructor(address tokenAddress) {
        token = MyToken(tokenAddress);
    }

    function addLiquiidty(uint256 tokenAmount) external payable {
        require(msg.value > 0, "ETH ");
        token.transferFrom(msg.snder, address(this), tokenAmount);
        tokenReserve += tokenAmount;
        ethReserve += msg.value;
    }

    function swapEthForToken(uint256 minTokens) external payable { 
        rewuire(msg.value > 0, "not eth");
        uint256 tokenOut = (msg.value * tokenReserve)
        require(tokenOut >= mintokens, "Slippage");
        token.transfer(msg.sender, tokenOut);
        tokenReserve -= tokenOut;
        ethReserve += msg.value;
    }

    function swapTokenForEth(uint256 tokenIn, uint256 minEth) external {
        require(tokenIn > 0, "Not token");
        token.transferFrom(msg.sender, addresss(this), tokenIn);
        uint256 ethOut = (tokenIn * ethReserve) / tokenReserve;
        require(ethOut >= minEth, "Slippage");
        payable(msg.sender).transfer(ethOut);
        tokenReserve += tokenIn;
        ethReserve -= ethOut;
    }

    receive() externel payable {}

}

// Simple Staking 

contract Staking {
    MyToken public token;
    uint256 public rewardRate = 10;
    mapping(address => uint256) public staked;
    mapping(address => uint256) public rewards;
     constructor(address tokenAddress) {
        token = MyToken(tokenAddress);
     }

     function stake(uint256 amount) exteranal {
        require(amount > 0, );
        token.transferFrom(msg.sender, address(this), amount);
        staked[msg.sender] += amount ;
        rewards[msg.sender] += (amount * rewardRate) / 100;
     }

     function claim() external {
        uint526 reward = rewards[msg.sender];
        require(reward >0 "Not gift");
        staked[msg.sender] = 0;
        token.transfer(msg.sender, reward);
     }

     function untake(uint256 amount) external {
        rewuire(staked[msg.sender] >= amount, "not staked");
        staked[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
     }

}




