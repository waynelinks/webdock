import { createServer, IncomingMessage, Server, ServerResponse } from "http";
import * as promClient from "prom-client";
import { Greeter } from "@damlys/the-greeter";
import { config } from "./config";
import { Logger } from "./Logger";
import { MessagePayload } from "./MessagePayload";

export class HttpServer {
    private readonly host: string;
    private readonly port: number;
    private readonly httpServer: Server;
    private readonly httpRequestsCounter: promClient.Counter;
    private readonly logger: Logger;

    public constructor() {
        this.host = config.host;
        this.port = config.port;
        this.httpServer = createServer();
        this.httpRequestsCounter = new promClient.Counter({
            name: "http_requests_count",
            help: "Number of processed HTTP requests.",
        });
        this.logger = new Logger("http-server");
    }

    public async run(): Promise<void> {
        this.httpServer.on("listening", (): void => {
            this.logger.info(`Listening on http://${this.host}:${this.port}`);
        });

        this.httpServer.on("request", this.processHttpRequest.bind(this));

        this.httpServer.on("error", (err: Error): void => {
            this.logger.critical(err);
            process.exit(1);
        });

        this.httpServer.on("close", (): void => {
            this.logger.info("Stopped");
        });

        this.httpServer.listen(this.port, this.host);

        process.on("SIGINT", this.shutdownGracefully.bind(this));
        process.on("SIGTERM", this.shutdownGracefully.bind(this));
    }

    private processHttpRequest(req: IncomingMessage, res: ServerResponse): void {
        this.logger.info(`Processing ${req.method} ${req.url}`);

        if (req.url === "/favicon.ico") {
            res.writeHead(404);
            res.end();
        } else if (req.url === "/-/healthy") {
            res.writeHead(200);
            res.end("Healthy.");
        } else if (req.url === "/-/ready") {
            res.writeHead(200);
            res.end("Ready.");
        } else if (req.url === "/-/metrics") {
            const metrics: string = promClient.register.metrics();
            res.writeHead(200, {
                "Content-Length": Buffer.byteLength(metrics),
                "Content-Type": promClient.register.contentType,
            });
            res.end(metrics);
        } else {
            const greeter: Greeter = new Greeter("world");
            const payload: MessagePayload = {
                method: req.method || "",
                url: req.url || "",
                message: greeter.greet(),
            };
            const body: string = JSON.stringify(payload);
            res.writeHead(200, {
                "Content-Length": Buffer.byteLength(body),
                "Content-Type": "application/json",
            });
            res.end(body);
        }

        this.httpRequestsCounter.inc();
    }

    private shutdownGracefully(): void {
        this.httpServer.close((): void => {
            process.exit(0);
        });
    }
}
