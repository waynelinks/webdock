#!/usr/bin/env node

import { HttpServer } from "../HttpServer";
import { Logger } from "../Logger";

async function bootstrap(): Promise<void> {
    process.on("uncaughtException", (error: Error): void => {
        (new Logger("uncaught-exception"))
            .critical(error);
        process.exit(2);
    });

    switch (process.argv[2] || "") {
        case "run-http-server":
            const httpServer: HttpServer = new HttpServer();
            httpServer.run();
            return;

        default:
            (new Logger("cli"))
                .critical("Application command not defined.");
            process.exit(127);
    }
}

bootstrap();
