import "jest";
import * as index from "../../src/index";

test("should export package stuff", (): void => {
    expect(index).toHaveProperty("Greeter");
});
