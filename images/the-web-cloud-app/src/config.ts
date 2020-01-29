class Config {
    public readonly host: string = "0.0.0.0";
    public readonly port: number = 8080;

    public constructor() {
        if (undefined !== process.env.WEBDOCK_HOST) {
            this.host = process.env.WEBDOCK_HOST;
        }
        if (undefined !== process.env.WEBDOCK_PORT) {
            this.port = parseInt(process.env.WEBDOCK_PORT, 10);
        }
    }
}

export const config: Config = new Config();
