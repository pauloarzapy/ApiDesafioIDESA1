<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('authors', function (Blueprint $table) {          
            $table->integer('id')->autoIncrement();
            $table->string('name')->unique();
            $table->date('birthdate');
            $table->string('nationality');
            $table->timestamps();
        });

        Schema::create('books', function (Blueprint $table) {
            $table->integer('id')->autoIncrement();
            $table->string('title');
            $table->string('isbn')->unique();
            $table->date('published_date');
            $table->integer('author_id')->index();
            $table->foreign('author_id')->references('id')->on('authors');
            $table->timestamps();
        });        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('books');
        Schema::dropIfExists('authors');
    }
};
