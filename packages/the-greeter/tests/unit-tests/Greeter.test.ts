import "jest";
import { Greeter } from "../../src/Greeter";

test("should greet Bob", () => {
    const greeter: Greeter = new Greeter("Bob");
    expect(greeter.greet()).toBe("Hello Bob!");
});
