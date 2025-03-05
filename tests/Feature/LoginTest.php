<?php
namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class LoginTest extends TestCase
{   
    /**
     * Prueba el metodo login.
    */    
    public function test_login(): void
    {
        $credenciales = [
            'email' => 'andrea@desafiox.com',
            'password' => '12345'
        ];  
                     
        $this->post('/api/auth/login', $credenciales)
        ->dump()
        ->assertStatus(200);         
    }       
}
