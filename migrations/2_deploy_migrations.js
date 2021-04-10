const OpenNFT = artifacts.require("OpenNFT");

module.exports = function (deployer) {
  deployer.deploy(OpenNFT);
};