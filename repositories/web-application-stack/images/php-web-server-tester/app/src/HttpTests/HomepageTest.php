<?php
declare(strict_types=1);

namespace HttpTests;

class HomepageTest extends \PHPUnit\Framework\TestCase
{
    public function getTestsTargetUrl(): string
    {
        return $_ENV['WEBSERVERTESTER_TESTS_TARGET_URL'];
    }

    public function testWelcomeMessage(): void
    {
        // Arrange
        $client = new \GuzzleHttp\Client();

        // Act
        $response = $client->request('GET', $this->getTestsTargetUrl());
        $payload = json_decode($response->getBody()->getContents(), true);

        // Assert
        $this->assertEquals(200, $response->getStatusCode());
        $this->assertEquals('application/json', array_shift($response->getHeader('Content-Type')));
        $this->assertEquals('Hello world!', $payload['message']);
    }
}
