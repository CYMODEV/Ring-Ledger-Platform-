// packages/api/src/config.ts
import dotenv from "dotenv";
dotenv.config();

export const cfg = {
  port: Number(process.env.PORT || 4000),
  dbUrl: process.env.POSTGRES_URL!,
  jwtSecret: process.env.JWT_SECRET!,
  cymosWebhookUrl: process.env.CYMOS_WEBHOOK_URL!,
  cymosApiKey: process.env.CYMOS_API_KEY!,
  chainRpc: process.env.CHAIN_RPC!,
  marketplaceAddress: process.env.MARKETPLACE_ADDRESS!,
  assetNftAddress: process.env.ASSETNFT_ADDRESS!,
  ringTokenAddress: process.env.RINGTOKEN_ADDRESS!,
};
