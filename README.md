# Transact Contract

This is a simple Solidity contract that demonstrates setting and incrementing a value while enforcing security and validation rules.

## Features

* Stores a public `value` variable.
* Allows setting the value with `setvalue` (rejects zero values).
* Increments the value with `incrementvalue` (limits delta to a maximum of 100).
* Utilizes `require` statements for mandatory checks.
* Employs `assert` for internal contract invariants (recommended for runtime checks, not security-critical rules).

## Installation

**Prerequisites:**

* Solidity compiler (https://docs.soliditylang.org/en/latest/installing-solidity.html)
* Development environment (e.g., Remix, Truffle, Hardhat)

**Deployment:**

1. Clone this repository.
2. Follow your development environment's instructions to deploy the contract to a blockchain network.

## Usage

**Setting the Value:**

```solidity
contract MyContract {
  Transact transactContract = new Transact(); // Instantiate the contract

  function setValue(uint _newValue) public {
    transactContract.setvalue(_newValue);
  }
}
