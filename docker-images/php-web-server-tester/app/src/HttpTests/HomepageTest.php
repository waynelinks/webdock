<?php
declare(strict_types=1);

namespace HttpTests;

class HomepageTest extends \PHPUnit\Framework\TestCase
{
    public function getTestsTargetEntrypoint(): string
    {
        return $_ENV['TESTER_TARGET_ENTRYPOINT'];
    }

    public function testWelcomeMessage(): void
    {
        $client = new \GuzzleHttp\Client();

        $response = $client->request('GET', $this->getTestsTargetEntrypoint());

        $this->assertEquals(200, $response->getStatusCode());
        $this->assertEquals('application/json', array_shift($response->getHeader('Content-Type')));
        $payload = json_decode($response->getBody()->getContents(), true);
        $this->assertEquals('Hello world!', $payload['message']);
    }
}
