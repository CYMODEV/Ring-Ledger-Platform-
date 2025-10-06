// packages/contracts/scripts/deploy.ts
import { ethers } from "hardhat";

async function main() {
  const Ring = await ethers.getContractFactory("RingToken");
  const ring = await Ring.deploy();
  await ring.waitForDeployment();

  const NFT = await ethers.getContractFactory("AssetNFT");
  const nft = await NFT.deploy();
  await nft.waitForDeployment();

  const Market = await ethers.getContractFactory("Marketplace");
  const market = await Market.deploy();
  await market.waitForDeployment();

  const Escrow = await ethers.getContractFactory("EscrowVault");
  const escrow = await Escrow.deploy();
  await escrow.waitForDeployment();

  const Bridge = await ethers.getContractFactory("RingletBridge");
  const bridge = await Bridge.deploy();
  await bridge.waitForDeployment();

  console.log("RING:", await ring.getAddress());
  console.log("ASSETNFT:", await nft.getAddress());
  console.log("MARKETPLACE:", await market.getAddress());
  console.log("ESCROW:", await escrow.getAddress());
  console.log("BRIDGE:", await bridge.getAddress());
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
