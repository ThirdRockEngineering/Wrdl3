import React, { useState, useEffect } from "react";
import SimpleStorageContract from "./contracts/SimpleStorage.json";
import Wrdl3Contract from "./contracts/Wrdl3.json";
import getWeb3 from "./getWeb3";
import Node from "./ipfs";

import "./App.css";

const App = (props) => {
  const [storageValue, setStorageValue] = useState(0);
  const [web3, setWeb3] = useState(null);
  const [accounts, setAccounts] = useState(null);
  const [contract, setContract] = useState(null);
  const [game, setGame] = useState(null);
  const [ipfsNode, setIpfsNode] = useState(null);

  const runExample = async () => {
    if (contract && accounts.length) {
      // Stores a given value, 5 by default.
      await contract.methods.set(5).send({ from: accounts[0] });

      // Get the value from the contract to prove it worked.
      const response = await contract.methods.get().call();

      // Update state with the result.
      setStorageValue(response);
    }
  };

  const awardBronze = async () => {
    if (game && accounts.length) {
      // Stores a given value, 5 by default.
      await game.methods.awardBronze(accounts[0]).send({ from: accounts[0] });

      // Get the value from the contract to prove it worked.
      const response = await game.methods.balanceOf(accounts[0], 2).call();
      // Update state with the result.
      console.log(response);
    }
  };

  useEffect(() => {
    (async () => {
      try {
        // Get network provider and web3 instance.
        const web3 = await getWeb3();

        // Get ipfs node instance

        const node = await Node;

        // Use web3 to get the user's accounts.
        const accounts = await web3.eth.getAccounts();

        // Get the contract instance.
        const networkId = await web3.eth.net.getId();
        let deployedNetwork = SimpleStorageContract.networks[networkId];
        const instance = new web3.eth.Contract(
          SimpleStorageContract.abi,
          deployedNetwork && deployedNetwork.address
        );

        await node.pubsub.subscribe("lobby", (msg) => {
          console.log(msg.data);
        });
        const peerIds = await node.pubsub.peers("lobby");
        console.log("From pubsub stuff:", peerIds);

        const topics = await node.pubsub.ls();
        console.log("Topics you are subscribed to:", topics);

        await node.pubsub.publish("main-room", "Hey dude, pubsub is working");

        setWeb3(web3);
        setAccounts(accounts);
        setContract(instance);
        setIpfsNode(node);
      } catch (error) {
        // Catch any errors for any of the above operations.
        alert(
          `Failed to load web3, accounts, or contract. Check console for details.`
        );
        console.error(error);
      }
    })();
  }, []);

  const [peers, setPeers] = useState('none')
  const handlePeers = async () => {
    const peerIds = await ipfsNode.pubsub.peers("lobby");
    setPeers(peerIds)
    console.log(peerIds)
    // console.log("From pubsub stuff:", peerIds);
  };

  useEffect(() => {
    // runExample();
  }, [accounts, contract]);

  if (!web3) {
    return <div>Loading Web3, accounts, and contract...</div>;
  }
  return (
    <div className="App">
      <h1>Good to Go!</h1>
      <p>Your Truffle Box is installed and ready.</p>
      <h2>Smart Contract Example</h2>
      <p>
        If your contracts compiled and migrated successfully, below will show a
        stored value of 5 (by default).
      </p>
      <p>
        Try changing the value stored on <strong>line 42</strong> of App.js.
      </p>
      <div>The stored value is: {storageValue}</div>

      <button onClick={e => handlePeers(e)}>Peers</button>
      <p>{`these are peers: ${peers}`}</p>
    </div>
  );
};

export default App;
