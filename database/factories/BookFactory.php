<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use \App\Models\Author;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Book>
 */
class BookFactory extends Factory
{
    /**
     * Inserta datos aleatorios a la tabla books.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
         'title' => $this->faker->sentence,
         'isbn' => $this->faker->sentence,
         'published_date' => $this->faker->date,
         'author_id' => Author::factory()
        ];
    }
}
