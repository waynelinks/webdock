import "jest";
import fetch, { Response } from "node-fetch";
import { config } from "../config";
import { MessagePayload } from "../../src/MessagePayload";

test("should return welcome message", async (): Promise<void> => {
    const res: Response = await fetch(config.targetEndpoint);
    const payload: MessagePayload = await res.json();

    expect(res.status).toBe(200);
    expect(res.headers.has("content-type")).toBe(true);
    expect(res.headers.get("content-type")).toBe("application/json");
    expect(payload.message).toBe("Hello world!");
});
