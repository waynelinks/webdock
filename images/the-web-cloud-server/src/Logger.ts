import { writeFileSync } from "fs";

export class Logger {
    private readonly channel: string;

    public constructor(channel: string = "default") {
        this.channel = channel;
    }

    public info(msg: Error | string): void {
        process.stdout.write(this.stringifyMessage(msg));
    }

    public error(msg: Error | string): void {
        process.stderr.write(this.stringifyMessage(msg));
    }

    public critical(msg: Error | string): void {
        this.error(msg);
        writeFileSync("/dev/termination-log", this.stringifyMessage(msg));
    }

    private stringifyMessage(msg: Error | string): string {
        return `[${this.channel}] ${msg.toString()}\n`;
    }
}
