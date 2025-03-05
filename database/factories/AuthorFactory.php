<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Author>
 */
class AuthorFactory extends Factory
{
    /**
     * Inserta datos aleatorios a la tabla authors.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
         'name' => $this->faker->sentence, 
         'birthdate' => $this->faker->date, 
         'nationality' => $this->faker->sentence
        ];
    }
}
