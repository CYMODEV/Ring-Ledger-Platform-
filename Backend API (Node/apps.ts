// packages/api/src/app.ts
import express from "express";
import cors from "cors";
import { usersRouter } from "./routes/users";
import { assetsRouter } from "./routes/assets";
import { projectsRouter } from "./routes/projects";
import { tradeRouter } from "./routes/trade";
import { tokenizationRouter } from "./routes/tokenization";
import { valuationRouter } from "./routes/valuation";
import { ringRouter } from "./routes/ring";

export const app = express();
app.use(cors());
app.use(express.json());

app.use("/users", usersRouter);
app.use("/assets", assetsRouter);
app.use("/projects", projectsRouter);
app.use("/trade", tradeRouter);
app.use("/mint", tokenizationRouter);
app.use("/valuation", valuationRouter);
app.use("/ring", ringRouter);

app.get("/health", (_, res) => res.json({ ok: true }));
