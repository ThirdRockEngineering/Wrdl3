const Asset = artifacts.require("Asset");

module.exports = function (deployer) {
  deployer.deploy(
    Asset,
    "0x0116E790A7AF6557713031a69115ff8803E50D14",
    "Wrdl3",
    "WCT",
    "0x4527be8f31e2ebfbef4fcaddb5a17447b27d2aef"
  );
};
