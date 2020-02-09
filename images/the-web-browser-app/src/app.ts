import { Greeter } from "@damlys/the-greeter";

async function boot(): Promise<void> {
    const greeter: Greeter = new Greeter('world');
    alert(greeter.greet());
}

window.addEventListener('load', boot);
