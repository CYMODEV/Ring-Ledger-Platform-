// packages/api/src/index.ts
import { app } from "./app";
import { cfg } from "./config";

app.listen(cfg.port, () => {
  console.log(`Ring Ledger API listening on :${cfg.port}`);
});
