# 🪙 Token Exchange – SkillsCoin ↔ RareCoin

This project is a simple token exchange built with Solidity.  
It demonstrates **ERC-20 tokens**, **minting**, **allowances**, and **cross-contract interactions**.

---

## 📖 Overview

- **SkillsCoin (SKL)**  
  - An ERC-20 token that *anyone* can mint.  
  - Used as the "currency" to acquire RareCoin.

- **RareCoin (RC)**  
  - An ERC-20 token that can only be obtained by trading SkillsCoin.  
  - Calls `SkillsCoin.transferFrom` to pull tokens in, and then mints new RareCoin.

---

## ⚡ Workflow

1. **Mint SkillsCoin**  
   Call `mint(amount)` on SkillsCoin to get some tokens.

2. **Approve RareCoin**  
   Call `approve(rareCoinAddress, amount)` on SkillsCoin, so RareCoin can use your tokens.

3. **Trade**  
   Call `trade(amount)` on RareCoin.  
   - RareCoin pulls `amount` SkillsCoin from you.  
   - RareCoin mints the same `amount` of RC to your wallet.

---

## 🛠️ How to Run (Remix IDE)

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create two files:
   - `SkillsCoin.sol`
   - `RareCoin.sol`
3. Compile both with **Solidity 0.8.20**.
4. Deploy `SkillsCoin`.
   - Mint tokens: `mint(1000)`.
5. Copy the SkillsCoin contract address.
6. Deploy `RareCoin`, passing in the SkillsCoin address.
7. On SkillsCoin:
   - `approve(rareCoinAddress, 1000)`.
8. On RareCoin:
   - `trade(500)`.
9. Check balances:
   - Your SkillsCoin decreased.
   - RareCoin contract holds your SkillsCoin.
   - You received RareCoin.

---

## 🔍 What You’ll Learn

- How ERC-20 tokens store balances & allowances.
- How to build `mint`, `transfer`, `approve`, and `transferFrom` by hand.
- How one contract calls another (cross-contract call).
- Why **Checks-Effects-Interactions (CEI)** pattern matters in Solidity.

---

## 📂 Project Structure

```
.
├── SkillsCoin.sol   # ERC-20 token anyone can mint
├── RareCoin.sol     # ERC-20 token traded for SkillsCoin
└── README.md
```

---

## 🚀 Future Improvements

- Add exchange rates (e.g., 2 SkillsCoin → 1 RareCoin).  
- Add withdrawal function so owner can recover locked SkillsCoin.  
- Add unit tests with Foundry or Hardhat.  

---

## 📝 License
MIT
