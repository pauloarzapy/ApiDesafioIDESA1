<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TestApiDesafioAuthors extends TestCase
{
    /**
     * Prueba el metodo GET /api/authors que obtiene lista de autores.
     */
    public function test_get_authors(): void
    {
        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->get('/api/authors')
        ->dump()
        ->assertStatus(200);       
    }  

    /**
     * Prueba el metodo GET /api/authors/id que obtiene los datos de un autor especifico.
     */
    public function test_get_authors_id(): void
    {
        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->get('/api/authors/5')
        ->dump()
        ->assertStatus(200);       
    }
    
    /**
     * Prueba el metodo POST /api/authors que da de alta un autor.
     */
    public function test_post_authors(): void
    { 
        $datos_nuevo_autor = [
            "name" => "Bruna Baez",
            "birthdate" => "21-07-1975",
            "nationality" => "Brasil",
        ];

        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->post('/api/authors', $datos_nuevo_autor)
        ->dump()
        ->assertStatus(200);       
    }   

    /**
     * Prueba el metodo PUT /api/authors/id que modifica los datos de un autor.
      */
    public function test_put_authors_id(): void
    { 
        $datos_autor = [
            "name" => "Bruna Baez Baez",
            "birthdate" => "22-08-1976",
            "nationality" => "Uruguay",
        ];

        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->put('/api/authors/10', $datos_autor)
        //->dump()
        ->assertStatus(200);       
    } 

    /**
     * Prueba el metodo DELETE /api/authors/id que elimina un autor de la base de datos.
     * Para ejecutar podria utilizarse el id 
     */
    public function test_delete_authors_id(): void
    {         
        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->delete('/api/authors/10')
        //->dump()
        ->assertStatus(200);       
    }     
}
