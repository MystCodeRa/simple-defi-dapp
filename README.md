## Simple DeFİ DAap 

This project is a "learning-oriented mini defi application" written in Solidity. 
It consists of three main compenents:
- My token -> A simple ERC29 token contract
- SimpleDEX -> basic decentralized exchange price (Dex) that allows ETH - Token swaps
- Staking -> A staking system that rewards users who lock their tokens

## feautures 
-ERC20 creation acording to the standart 
- ETH Token swap with automatic price adjustment
- Liqiudity provossion (Liquidity Pool concept)
- Easy to test and deploy on Remix IDE 


## How to Run 
1. Open Remix IDE
2. Create a new file named "Project.sol" and paste the Solidity code from this repository.
3. In the Compiler tab, select version '0.8.17' and compile
4. Deploy the contract in the following order:
   - Ny Token -> e.g., '1000' (total Supply)
   - SimpleDex -> Enter the same My Token address
5. Now you can:
   - Stake your tokens
   - Swap ETH  tokens on the DEX
   - Add Liquidity to the pool


## Educational Note 
This project is cretaed for learning and demonstration purposes 
It should not be used as a real DEX or staking platform 
For a more advenced version, you can implement 
- LP token minint
- Fee disteibution
- Security auditing
- Ratio and prive optimization
- 


