<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TestApiDesafioBooks extends TestCase
{
    /**
     * Prueba el metodo GET /api/books que obtiene lista de libros.
     */
    public function test_get_books(): void
    {
        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->get('/api/books')
        ->dump()
        ->assertStatus(200);       
    }  

    /**
     * Prueba el metodo GET /api/books/id que obtiene los datos de un libro especifico.
     */
    public function test_get_books_id(): void
    {
        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->get('/api/books/4')
        ->dump()
        ->assertStatus(200);       
    }
    
    /**
     * Prueba el metodo POST /api/books que da de alta un libro.
     */
    public function test_post_books(): void
    { 
        $datos_nuevo_libro = [
            "title" => "Programacion en Fortran",
            "isbn" => "4545-444-7772",
            "published_date" => "19-10-1984",
            "author_id" => "8",
        ];

        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->post('/api/books', $datos_nuevo_libro)
        ->dump()
        ->assertStatus(200);       
    }   

    /**
     * Prueba el metodo PUT /api/books/id que modifica los datos de un libro.
     */
    public function test_put_books_id(): void
    { 
        $datos_libro = [
            "title" => "Programacion en Fortran 77",
            "isbn" => "4545-4488-7772",
            "published_date" => "29-11-1984",
            "author_id" => "8",
        ];

        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->put('/api/books/10', $datos_libro)
        //->dump()
        ->assertStatus(200);       
    } 

    /**
     * Prueba el metodo DELETE /api/books/id que elimina un libro de la base de datos.
     */
    public function test_delete_books_id(): void
    {         
        $this->withHeaders(['Authorization' => 'bearer 5|KZw2F32JttvXOETkIzKK5WczrNy2IikJcCmSpqr9dc47063a'])
        ->delete('/api/books/10')
        //->dump()
        ->assertStatus(200);       
    }  
}
