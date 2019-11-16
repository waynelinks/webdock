import "jest";
import * as index from "../../src/index";

test("should export package stuff", () => {
    expect(index).toHaveProperty("Greeter");
});
