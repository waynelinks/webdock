import "jest";
import * as index from "../../src/index";

test("should export public API parts", (): void => {
    expect(index).toHaveProperty("Greeter");
});
