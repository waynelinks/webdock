import { writeFileSync } from "fs";

export class Logger {
    private readonly channel: string;

    public constructor(channel: string = "default") {
        this.channel = channel;
    }

    public info(msg: any): void {
        process.stdout.write(this.stringifyMessage(msg));
    }

    public error(msg: any): void {
        process.stderr.write(this.stringifyMessage(msg));
    }

    public critical(msg: any): void {
        this.error(msg);
        writeFileSync("/dev/termination-log", this.stringifyMessage(msg));
    }

    private stringifyMessage(msg: any): string {
        return `[${this.channel}] ${msg.toString()}\n`;
    }
}
