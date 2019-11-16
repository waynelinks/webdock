class Config {
    public readonly targetEndpoint: string = "http://127.0.0.1:8080";

    public constructor() {
        if (undefined !== process.env.WEBDOCK_TARGET_ENDPOINT) {
            this.targetEndpoint = process.env.WEBDOCK_TARGET_ENDPOINT;
        }
    }
}

export const config: Config = new Config();
