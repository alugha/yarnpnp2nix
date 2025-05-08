import fs from "node:fs";

const source = fs.readFileSync("dist/plugin-yarnpnp2nix.js", {
    encoding: "utf-8",
});
fs.writeFileSync("dist/plugin-yarnpnp2nix.js", source.replaceAll('w("node:', 'w("'), { encoding: "utf-8" });
