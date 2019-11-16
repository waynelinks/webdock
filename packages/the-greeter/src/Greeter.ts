export class Greeter {
    private readonly name: string;

    public constructor(name: string) {
        this.name = name;
    }

    public greet(): string {
        return `Hello ${this.name}!`;
    }
}
