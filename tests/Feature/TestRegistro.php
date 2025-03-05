<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TestRegistro extends TestCase
{
    
    /**
     * Prueba el metodo register para agregar un nuevo usuario a la base de datos.
    */
    public function test_registro(): void
    {
        $datos_nuevo_usuario = [
            "name" => "Pedro Perez",
            "email" => "predroi@unemail.com",
            "password" => "23456",
            "passwordConfirm" => "23456"
        ];

        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->post('/api/auth/register', $datos_nuevo_usuario)
        ->dump()
        ->assertStatus(200);       
    }   
}
