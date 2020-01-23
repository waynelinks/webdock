import axios, { AxiosResponse } from "axios";
import "jest";
import { config } from "../../src/config";

test("should return welcome message", async (): Promise<void> => {
    const res: AxiosResponse = await axios.get(config.targetEndpoint);

    expect(res.status).toBe(200);
    expect(res.headers["content-type"]).toBe("application/json");
    expect(res.data.message).toBe("Hello world!");
});
