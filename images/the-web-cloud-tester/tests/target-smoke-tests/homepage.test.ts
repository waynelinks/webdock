import "jest";
import fetch, { Response } from "node-fetch";
import { config } from "../../src/config";
import { HomepagePayload } from "../../src/HomepagePayload";

test("should return welcome message", async (): Promise<void> => {
    const res: Response = await fetch(config.targetEndpoint);
    const payload: HomepagePayload = await res.json();

    expect(res.status).toBe(200);
    expect(res.headers.has("content-type")).toBe(true);
    expect(res.headers.get("content-type")).toBe("application/json");
    expect(payload.message).toBe("Hello world!");
});
