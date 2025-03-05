<?php

namespace Database\Seeders;

use App\Models\Author;
use Illuminate\Database\Seeder;

class AuthorsSeeder extends Seeder
{
    /**
     * Inserta 5 autores de libros.
     */
    public function run(): void
    {
        Author::factory(count:5)->create();
    }
}
