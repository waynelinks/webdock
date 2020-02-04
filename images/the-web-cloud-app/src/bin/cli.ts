#!/usr/bin/env node

import { HttpServer } from "../HttpServer";
import { Logger } from "../Logger";

async function boot(): Promise<void> {
    process.on("uncaughtException", (error: Error): void => {
        (new Logger("uncaught-exception"))
            .critical(error);
        process.exit(2);
    });

    const command: string = process.argv[2] || "";
    if (command === "run-http-server") {
        (new HttpServer())
            .run();
    } else {
        (new Logger("cli"))
            .critical("Application command not defined.");
        process.exit(127);
    }
}

boot();
