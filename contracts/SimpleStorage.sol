// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract SimpleStorage {
  uint storedData;

  function set(uint x) public {
    storedData = x;
  }

  function get() public view returns (uint) {
    return storedData;
  }
}

addToSimpleStorage() {
  if (this.state.simpleStorageInstance && this.state.accounts) {
    const value = this.storageAmountInput.value;
    this.state.simpleStorageInstance.set(value, {from: this.state.accounts[0]})
      .then((result) => {
        return this.state.simpleStorageInstance.get.call(this.state.accounts[0])
      }).then((result) => {
        this.setState(prevState => ({
          ...prevState,
          storageValue: result.c[0]
        }));
      }).catch((err) => {
        console.log('error');
        console.log(err);
      });
  } else {
    this.setState(prevState => ({
      ...prevState,
      error: new Error('simple storage instance not loaded')
    }))
  }
}