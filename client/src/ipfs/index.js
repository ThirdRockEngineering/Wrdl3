import  * as IPFS from "ipfs-core";

const main = async () => {
  const ipfs = await IPFS.create({
    repo: repo(), // random so we get a new peerid every time, useful for testing
    config: {
      Bootstrap: [
        "/dns6/ipfs.thedisco.zone/tcp/4430/wss/p2p/12D3KooWChhhfGdB9GJy1GbhghAAKCUR99oCymMEVS4eUcEy67nt",
        "/dns4/ipfs.thedisco.zone/tcp/4430/wss/p2p/12D3KooWChhhfGdB9GJy1GbhghAAKCUR99oCymMEVS4eUcEy67nt",
      ],

      Addresses: {
        Swarm: [
          "/dns4/star.thedisco.zone/tcp/9090/wss/p2p-webrtc-star",
          "/dns6/star.thedisco.zone/tcp/9090/wss/p2p-webrtc-star",
        ],
      },
    },
    host: "ipfs.infura.io",
    port: 5001,
    protocol: "https",
  });
  return ipfs;
};

function repo() {
  return "game_channel/" + Math.random();
}

//* We will return just promise in any case - we have to await it in
//* App component. I dunno better way to do that :(
export default main();
