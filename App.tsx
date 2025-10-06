import React from "react";
import { Dashboard } from "./pages/Dashboard";
import { Projects } from "./pages/Projects";
import { Trading } from "./pages/Trading";
import { USGSMine } from "./pages/USGSMine";

export const App: React.FC = () => {
  const [page, setPage] = React.useState<"dashboard"|"projects"|"trading"|"usgs">("dashboard");
  return (
    <div style={{ background: "#111", color: "#fff", minHeight: "100vh", fontFamily: "system-ui" }}>
      <nav style={{ display: "flex", gap: 24, padding: 16, borderBottom: "1px solid #333" }}>
        <div style={{ fontWeight: 700 }}>Ring Ledger</div>
        <button onClick={() => setPage("dashboard")}>Dashboard</button>
        <button onClick={() => setPage("projects")}>Projects</button>
        <button onClick={() => setPage("trading")}>Trading</button>
        <button onClick={() => setPage("usgs")}>USGS Mine</button>
      </nav>
      <div style={{ padding: 24 }}>
        {page === "dashboard" && <Dashboard />}
        {page === "projects" && <Projects />}
        {page === "trading" && <Trading />}
        {page === "usgs" && <USGSMine />}
      </div>
    </div>
  );
};
